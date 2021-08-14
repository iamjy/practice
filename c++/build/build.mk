#!/bin/bash
include build/make-rule/compiler.mk
include build/make-rule/compile-option.mk
include build/make-rule/compile-path.mk

SHELL := /bin/bash

BUILD_DIR  := $(TOP_DIR)/out
TARGET_OUT := $(BUILD_DIR)
export TARGET_OUT

SRC_BASE	:= $(CUR_DIR)/src/base/src
SRC_MAIN	:= $(CUR_DIR)/src/main/src

BUILD_BASE	:= base
BUILD_MAIN	:= main


all: $(BUILD_MAIN)
#all: $(BUILD_BASE)
#all: $(BUILD_BASE) $(BUILD_MAIN)

$(BUILD_BASE):
	$(MAKE) -C $(SRC_BASE)
	$(MAKE) -C $(SRC_BASE) install

$(BUILD_MAIN):
	$(MAKE) -C $(SRC_MAIN)
	$(MAKE) -C $(SRC_MAIN) install

install:
	$(MAKE) -C $(SRC_BASE) install
	$(MAKE) -C $(SRC_MAIN) install

clean:
	-$(MAKE) -C $(SRC_BASE) clean
	-$(MAKE) -C $(SRC_MAIN) clean

