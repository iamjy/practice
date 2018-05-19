#!/bin/bash
include build/make-rule/compiler.mk
include build/make-rule/compile-option.mk
include build/make-rule/compile-path.mk

SHELL := /bin/bash

BUILD_DIR  := $(TOP_DIR)/out
TARGET_OUT := $(BUILD_DIR)
export TARGET_OUT

SRC_BASE	:= $(CUR_DIR)/src/base/src
SRC_BITFIELD	:= $(CUR_DIR)/src/bitfield/src
SRC_FUNCTION	:= $(CUR_DIR)/src/function/src
SRC_KEYWORD	:= $(CUR_DIR)/src/keyword/src
SRC_OPT		:= $(CUR_DIR)/src/opt/src
SRC_POINTER	:= $(CUR_DIR)/src/pointer/src
SRC_MACRO	:= $(CUR_DIR)/src/macro/src

BUILD_BASE	:= base
BUILD_KEYWORD	:= keyword
BUILD_POINTER	:= pointer
BUILD_FUNCTION	:= function
BUILD_BITFIELD	:= bitfield
BUILD_OPT	:= opt
BUILD_MACRO	:= macro


all: $(BUILD_COMMON) $(BUILD_BASE) $(BUILD_KEYWORD) $(BUILD_POINTER) $(BUILD_FUNCTION) $(BUILD_BITFIELD) $(BUILD_OPT) $(BUILD_MACRO)

$(BUILD_BASE):
	$(MAKE) -C $(SRC_BASE)
	$(MAKE) -C $(SRC_BASE) install

$(BUILD_KEYWORD):
	$(MAKE) -C $(SRC_KEYWORD)
	$(MAKE) -C $(SRC_KEYWORD) install

$(BUILD_POINTER):
	$(MAKE) -C $(SRC_POINTER)
	$(MAKE) -C $(SRC_POINTER) install

$(BUILD_FUNCTION):
	$(MAKE) -C $(SRC_FUNCTION)
	$(MAKE) -C $(SRC_FUNCTION) install

$(BUILD_BITFIELD):
	$(MAKE) -C $(SRC_BITFIELD)
	$(MAKE) -C $(SRC_BITFIELD) install

$(BUILD_OPT):
	$(MAKE) -C $(SRC_OPT)
	$(MAKE) -C $(SRC_OPT) install

$(BUILD_MACRO):
	$(MAKE) -C $(SRC_MACRO)
	$(MAKE) -C $(SRC_MACRO) install

install:
	$(MAKE) -C $(SRC_BITFIELD) install
	$(MAKE) -C $(SRC_FUNCTION) install
	$(MAKE) -C $(SRC_POINTER) install
	$(MAKE) -C $(SRC_KEYWORD) install
	$(MAKE) -C $(SRC_BASE) install
	$(MAKE) -C $(SRC_OPT) install
	$(MAKE) -C $(SRC_MACRO) install

clean:
	-$(MAKE) -C $(SRC_BITFIELD) clean
	-$(MAKE) -C $(SRC_FUNCTION) clean
	-$(MAKE) -C $(SRC_POINTER) clean
	-$(MAKE) -C $(SRC_KEYWORD) clean
	-$(MAKE) -C $(SRC_BASE) clean
	-$(MAKE) -C $(SRC_OPT) clean
	-$(MAKE) -C $(SRC_MACRO) clean
	-$(MAKE) -C $(SRC_BASE) clean
