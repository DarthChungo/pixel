CXX      := g++
CXXFLAGS := -pedantic-errors -Wall -std=c++20 -I. -m64
LDFLAGS  := -lX11 -lGL -lpthread -lpng -lstdc++

BUILD    := ./build
OBJ_DIR  := $(BUILD)
BIN_DIR  := $(BUILD)/bin

SRC      := samples/lines.cpp # Change which sample you want to test here
HEADER   := pixel/pixel.hpp

TARGET   := sample

.PHONY: all build clean debug release

all: $(BUILD)/$(TARGET)

$(BUILD)/$(TARGET): $(SRC) $(HEADER)
	$(CXX) $(CXXFLAGS) -o $(BUILD)/$(TARGET) $< $(LDFLAGS)

debug: CXXFLAGS += -DDEBUG -g
debug: all

release: CXXFLAGS += -Ofast -flto
release: all

clean:
	-@rm -rvf $(BUILD)/*
