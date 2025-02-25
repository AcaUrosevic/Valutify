# Compiler
CXX = g++

WX_CONFIG = I:/wxWidgets-3.2.6/build/msw/wx-config
WX_DIR = I:/wxWidgets-3.2.6

# Detect platform
ifeq ($(OS),Windows_NT)
    PLATFORM_WINDOWS = 1
else
    PLATFORM_LINUX = 1
endif

# Directories
SRC_DIR = src
BUILD_DIR = build
INCLUDE_DIR = inc

# Source files
SRC_FILES = $(SRC_DIR)/main.cpp

#OBJ FILES
OBJ_FILES = $(BUILD_DIR)/main.o

# Output binaries
TARGET_WINDOWS = $(BUILD_DIR)/voltify.exe
TARGET_LINUX = $(BUILD_DIR)/voltify

# Compiler and linker flags
CXXFLAGS_COMMON = -I$(INCLUDE_DIR) -c
LDFLAGS_COMMON = 

CXXFLAGS_WINDOWS = -DPLATFORM_WINDOWS -DUNICODE -DNDEBUG -I$(WX_DIR)/include -I$(WX_DIR)/lib/gcc_lib/mswu
LDFLAGS_WINDOWS =  -Wall -pipe -mthreads -L$(WX_DIR)/lib/gcc_lib -static -mwindows -mthreads \
    -lwxmsw32u \
    -lwxpng -lwxjpeg -lwxzlib -lwxexpat -lwxregexu \
    -lole32 -loleaut32 -luuid -lrpcrt4 -ladvapi32 -lshell32 -lshlwapi -lcomctl32 -lgdi32 \
	-luxtheme -lversion -lwinspool -loleacc
	
CXXFLAGS_LINUX = -DPLATFORM_LINUX `$(WX_CONFIG) --cxxflags`
LDFLAGS_LINUX = `$(WX_CONFIG) --libs`

# Build rules
all: windows

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Windows build
windows: $(BUILD_DIR) $(TARGET_WINDOWS)

$(TARGET_WINDOWS): $(SRC_FILES)
	$(CXX) $(CXXFLAGS_COMMON) $(CXXFLAGS_WINDOWS) $(SRC_FILES) -o $(BUILD_DIR)/main.o 
	$(CXX) $(BUILD_DIR)/main.o -o $(TARGET_WINDOWS) $(LDFLAGS_WINDOWS) 


clean:
	rm -rf $(BUILD_DIR)
