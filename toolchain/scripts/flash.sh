#!/usr/bin/env bash
set -euo pipefail

MCU="${MCU:-atmega328p}"
PROGRAMMER="${PROGRAMMER:-arduino}"
BAUD="${BAUD:-115200}"

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <firmware.hex> <port>"
  echo "Example: $0 build/app.hex COM6"
  exit 1
fi

HEX="$1"
PORT="$2"
BACKUP_DIR="${FUSE_BACKUP_DIR:-fuse-backups}"
mkdir -p "${BACKUP_DIR}"

if [[ ! -f "${HEX}" ]]; then
  echo "HEX file not found: ${HEX}"
  exit 1
fi

STAMP="$(date +%Y%m%d_%H%M%S)"
FUSE_LOG="${BACKUP_DIR}/${MCU}_${STAMP}_fuses.txt"

echo "[1/4] Probe programmer and target (no write)"
avrdude -v -p "${MCU}" -c "${PROGRAMMER}" -P "${PORT}" -b "${BAUD}" -n

echo "[2/4] Read and back up fuses -> ${FUSE_LOG}"
{
  echo "timestamp=${STAMP}"
  echo "mcu=${MCU}"
  echo "port=${PORT}"
  echo "programmer=${PROGRAMMER}"
  avrdude -v -p "${MCU}" -c "${PROGRAMMER}" -P "${PORT}" -b "${BAUD}" \
    -U lfuse:r:-:h -U hfuse:r:-:h -U efuse:r:-:h
} > "${FUSE_LOG}" 2>&1

echo "[3/4] Flash program memory only"
avrdude -v -p "${MCU}" -c "${PROGRAMMER}" -P "${PORT}" -b "${BAUD}" -D \
  -U "flash:w:${HEX}:i"

echo "[4/4] Complete"
echo "Fuse writes intentionally disabled in this script."
echo "If you truly need fuse edits, use a dedicated reviewed command."

