#!/bin/bash
include build/make-rule/compiler.mk
include build/make-rule/compile-option.mk
include build/make-rule/compile-path.mk

SHELL := /bin/bash

BUILD_DIR  := $(TOP_DIR)/out
TARGET_OUT := $(BUILD_DIR)
export TARGET_OUT

SRC_BASE	:= $(CUR_DIR)/src/base/src
SRC_STL		:= $(CUR_DIR)/src/STL/src
SRC_BASIC	:= $(CUR_DIR)/src/basic/src
SRC_POINTER	:= $(CUR_DIR)/src/pointer/src

BUILD_BASE	:= base
BUILD_STL	:= stl
BUILD_BASIC	:= basic
BUILD_POINTER	:= pointer


all: $(BUILD_COMMON) $(BUILD_STL) $(BUILD_BASIC) $(BUILD_POINTER)

$(BUILD_BASE):
	$(MAKE) -C $(SRC_BASE)
	$(MAKE) -C $(SRC_BASE) install

$(BUILD_STL):
	$(MAKE) -C $(SRC_STL)
	$(MAKE) -C $(SRC_STL) install

$(BUILD_BASIC):
	$(MAKE) -C $(SRC_BASIC)
	$(MAKE) -C $(SRC_BASIC) install

$(BUILD_POINTER):
	$(MAKE) -C $(SRC_POINTER)
	$(MAKE) -C $(SRC_POINTER) install

install:
	$(MAKE) -C $(SRC_BASE) install
	$(MAKE) -C $(SRC_STL) install
	$(MAKE) -C $(SRC_POINTER) install

clean:
	-$(MAKE) -C $(SRC_BASE) clean
	-$(MAKE) -C $(SRC_STL) clean
	-$(MAKE) -C $(SRC_POINTER) clean

