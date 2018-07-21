#!/bin/bash
include build/make-rule/compiler.mk
include build/make-rule/compile-option.mk
include build/make-rule/compile-path.mk

SHELL := /bin/bash

SRC_BASE        := $(CUR_DIR)/src/base/src
SRC_COMMON	:= $(CUR_DIR)/src/common/src

BUILD_BASE	:= base
BUILD_COMMON	:= common

all: $(BUILD_BASE) $(BUILD_COMMON)

$(BUILD_BASE):
	$(MAKE) -C $(SRC_BASE) $$1
	$(MAKE) -C $(SRC_BASE) install

$(BUILD_COMMON):
	$(MAKE) -C $(SRC_COMMON) $$1
	$(MAKE) -C $(SRC_COMMON) install

install:
	$(MAKE) -C $(SRC_BASE) install
	$(MAKE) -C $(SRC_COMMON) install

clean:
	-$(MAKE) -C $(SRC_BASE) clean
	-$(MAKE) -C $(SRC_COMMON) clean
