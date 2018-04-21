#!/bin/bash
include build/compiler.mk
include build/compile.mk
include build/path.mk

SHELL := /bin/bash

BUILD_DIR  := $(TOP_DIR)/out
TARGET_OUT := $(BUILD_DIR)
export TARGET_OUT

SRC_BASE	:= $(CUR_DIR)/src/base/src
SRC_KEYWORD	:= $(CUR_DIR)/src/keyword
SRC_POINTER	:= $(CUR_DIR)/src/pointer
SRC_FUNCTION	:= $(CUR_DIR)/src/function
SRC_BITFIELD	:= $(CUR_DIR)/src/bitfield

BUILD_BASE	:= base
BUILD_KEYWORD	:= keyword
BUILD_POINTER	:= pointer
BUILD_FUNCTION	:= function
BUILD_BITFIELD	:= bitfield

all: $(BUILD_COMMON) $(BUILD_BASE) $(BUILD_KEYWORD) $(BUILD_POINTER) $(BUILD_FUNCTION) $(BUILD_BITFIELD)

$(BUILD_BASE):
	$(MAKE) -C $(SRC_BASE)

$(BUILD_KEYWORD):
	$(MAKE) -C $(SRC_KEYWORD)

$(BUILD_POINTER):
	$(MAKE) -C $(SRC_POINTER)

$(BUILD_FUNCTION):
	$(MAKE) -C $(SRC_FUNCTION)

$(BUILD_BITFIELD):
	$(MAKE) -C $(SRC_BITFIELD)


clean:
	-$(MAKE) -C $(SRC_BITFIELD) clean
	-$(MAKE) -C $(SRC_FUNCTION) clean
	-$(MAKE) -C $(SRC_POINTER) clean
	-$(MAKE) -C $(SRC_KEYWORD) clean
	-$(MAKE) -C $(SRC_BASE) clean
