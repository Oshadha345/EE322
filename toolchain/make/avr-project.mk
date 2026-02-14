# Normalize the input path
ACT_DIR   := $(patsubst %/,%,$(Activity))
SRC_FILES := $(wildcard $(ACT_DIR)/*.c) $(wildcard $(ACT_DIR)/*.S)
PROJECT   := $(notdir $(ACT_DIR))
BUILD_DIR := $(ACT_DIR)/build

# Default AVR flags (can be extended/overridden by parent makefiles)
CFLAGS  ?=
LDFLAGS ?=
CFLAGS  += -mmcu=$(MCU) -DF_CPU=$(F_CPU)
LDFLAGS += -mmcu=$(MCU)

# Debugging Check
ifeq ($(strip $(SRC_FILES)),)
$(error ERROR: No source files found in $(ACT_DIR). Path check: $(abspath $(ACT_DIR)))
endif

# Map sources to objects
OBJ := $(patsubst $(ACT_DIR)/%.c, $(BUILD_DIR)/%.o, $(filter %.c,$(SRC_FILES)))
OBJ += $(patsubst $(ACT_DIR)/%.S, $(BUILD_DIR)/%.o, $(filter %.S,$(SRC_FILES)))

ELF := $(BUILD_DIR)/$(PROJECT).elf
HEX := $(BUILD_DIR)/$(PROJECT).hex

all: build

$(BUILD_DIR):
	mkdir -p "$@"

# Use explicit rules for objects
# Compile C
$(BUILD_DIR)/%.o: $(ACT_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c "$<" -o "$@"

# Assemble (MAKE SURE $(CFLAGS) IS HERE!)
$(BUILD_DIR)/%.o: $(ACT_DIR)/%.S | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c "$<" -o "$@"

$(ELF): $(OBJ)
	$(CC) $(LDFLAGS) $(OBJ) -o "$@"

$(HEX): $(ELF)
	$(OBJCOPY) -O ihex -R .eeprom "$<" "$@"

build: $(HEX)
	@echo "--- Build Complete: $(HEX) ---"

clean:
	rm -rf "$(BUILD_DIR)"

.PHONY: all build clean