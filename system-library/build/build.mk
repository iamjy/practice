#!/bin/bash

## Inclusion
include build/make-rule/compiler.mk
include build/make-rule/compile-option.mk
include build/make-rule/compile-path.mk

SHELL := /bin/bash

BUILD_DIR  := $(TOP_DIR)/out
TARGET_OUT := $(BUILD_DIR)
export TARGET_OUT

## Build directory path
SRC_PROCESS := $(CUR_DIR)/src/process/src
SRC_SIGNAL := $(CUR_DIR)/src/signal/src
SRC_THREAD := $(CUR_DIR)/src/thread/src

## Build command
BUILD_PROCESS := process
BUILD_SIGNAL := signal
BUILD_THREAD := thread

all: $(BUILD_PROCESS) $(BUILD_SIGNAL) $(BUILD_THREAD)

$(BUILD_PROCESS):
	$(MAKE) -C $(SRC_PROCESS)

$(BUILD_SIGNAL):
	$(MAKE) -C $(SRC_SIGNAL)

$(BUILD_THREAD):
	$(MAKE) -C $(SRC_THREAD)

install:
	$(MAKE) -C $(SRC_PROCESS) install
	$(MAKE) -C $(SRC_SIGNAL) install
	$(MAKE) -C $(SRC_THREAD) install

clean:
	$(MAKE) -C $(SRC_PROCESS) clean
	$(MAKE) -C $(SRC_SIGNAL) clean
	$(MAKE) -C $(SRC_THREAD) clean
