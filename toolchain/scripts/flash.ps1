param(
    [string]$HexFile,
    [string]$Port="COM28"
)

Write-Host "Probing device..."
avrdude -n -v -c arduino -p m328p -P $Port -b 115200

Write-Host "Flashing program memory only..."
avrdude -v -c arduino -p m328p -P $Port -b 115200 `
-U flash:w:$HexFile
