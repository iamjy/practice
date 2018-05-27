#!/bin/bash
include build/make-rule/compiler.mk
include build/make-rule/compile-option.mk
include build/make-rule/compile-path.mk

SHELL := /bin/bash

SRC_BASE        := $(CUR_DIR)/src/base/src
SRC_COMMON	:= $(CUR_DIR)/src/common/src
SRC_DYNAMIC	:= $(CUR_DIR)/src/dynamic/src
SRC_STATIC	:= $(CUR_DIR)/src/static/src

BUILD_BASE	:= base
BUILD_COMMON	:= common
BUILD_DYNAMIC	:= dynamic
BUILD_STATIC	:= static

all: $(BUILD_BASE) $(BUILD_COMMON) $(BUILD_DYNAMIC) $(BUILD_STATIC)

$(BUILD_BASE):
	$(MAKE) -C $(SRC_BASE) $$1
	$(MAKE) -C $(SRC_COMMON) install

$(BUILD_COMMON):
	$(MAKE) -C $(SRC_COMMON) $$1
	$(MAKE) -C $(SRC_COMMON) install

$(BUILD_DYNAMIC):
	$(MAKE) -C $(SRC_DYNAMIC) 

$(BUILD_STATIC):
	$(MAKE) -C $(SRC_STATIC)

install:
	$(MAKE) -C $(SRC_BASE) install
	$(MAKE) -C $(SRC_COMMON) install
	$(MAKE) -C $(SRC_DYNAMIC) install
	$(MAKE) -C $(SRC_STATIC) install

clean:
	-$(MAKE) -C $(SRC_BASE) clean
	-$(MAKE) -C $(SRC_COMMON) clean
	-$(MAKE) -C $(SRC_DYNAMIC) clean
	-$(MAKE) -C $(SRC_STATIC) clean
