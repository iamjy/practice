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
SRC_FILE := $(CUR_DIR)/src/file/src
SRC_MEMORY := $(CUR_DIR)/src/memory/src
SRC_MSGQ := $(CUR_DIR)/src/msgq/src
SRC_PROCESS := $(CUR_DIR)/src/process/src
SRC_SEMAPHORE := $(CUR_DIR)/src/semaphore/src
SRC_SIGNAL := $(CUR_DIR)/src/signal/src
SRC_STRING := $(CUR_DIR)/src/string/src
SRC_SYNC := $(CUR_DIR)/src/sync/src
SRC_THREAD := $(CUR_DIR)/src/thread/src
SRC_TIME := $(CUR_DIR)/src/time/src

## Build command
BUILD_FILE := file
BUILD_MEMORY := memory
BUILD_MSGQ := msgq
BUILD_PROCESS := process
BUILD_SEMAPHORE := semaphore
BUILD_SIGNAL := signal
BUILD_STRING := string
BUILD_SYNC := sync
BUILD_THREAD := thread
BUILD_TIME := time

all: $(BUILD_FILE) $(BUILD_MEMORY) $(BUILD_MSGQ) $(BUILD_PROCESS) $(BUILD_SEMAPHORE) $(BUILD_SIGNAL) $(BUILD_STRING) $(BUILD_SYNC) $(BUILD_THREAD) $(BUILD_TIME)

$(BUILD_FILE):
	$(MAKE) -C $(SRC_FILE)

$(BUILD_MEMORY):
	$(MAKE) -C $(SRC_MEMORY)

$(BUILD_MSGQ):
	$(MAKE) -C $(SRC_MSGQ)

$(BUILD_PROCESS):
	$(MAKE) -C $(SRC_PROCESS)

$(BUILD_SEMAPHORE):
	$(MAKE) -C $(SRC_SEMAPHORE)

$(BUILD_SIGNAL):
	$(MAKE) -C $(SRC_SIGNAL)

$(BUILD_STRING):
	$(MAKE) -C $(SRC_STRING)

$(BUILD_SYNC):
	$(MAKE) -C $(SRC_SYNC)

$(BUILD_THREAD):
	$(MAKE) -C $(SRC_THREAD)

$(BUILD_TIME):
	$(MAKE) -C $(SRC_TIME)

install:
	-$(MAKE) -C $(SRC_FILE) install
	-$(MAKE) -C $(SRC_MEMORY) install
	-$(MAKE) -C $(SRC_MSGQ) install
	-$(MAKE) -C $(SRC_PROCESS) install
	-$(MAKE) -C $(SRC_SEMAPHORE) install
	-$(MAKE) -C $(SRC_SIGNAL) install
	-$(MAKE) -C $(SRC_STRING) install
	-$(MAKE) -C $(SRC_SYNC) install
	-$(MAKE) -C $(SRC_THREAD) install
	-$(MAKE) -C $(SRC_TIME) install

clean:
	-$(MAKE) -C $(SRC_FILE) clean
	-$(MAKE) -C $(SRC_MEMORY) clean
	-$(MAKE) -C $(SRC_MSGQ) clean
	-$(MAKE) -C $(SRC_PROCESS) clean
	-$(MAKE) -C $(SRC_SEMAPHORE) clean
	-$(MAKE) -C $(SRC_SIGNAL) clean
	-$(MAKE) -C $(SRC_STRING) clean
	-$(MAKE) -C $(SRC_SYNC) clean
	-$(MAKE) -C $(SRC_THREAD) clean
	-$(MAKE) -C $(SRC_TIME) clean
