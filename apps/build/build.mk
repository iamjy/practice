#!/bin/bash
include build/make-rule/compiler.mk
include build/make-rule/compile-option.mk
include build/make-rule/compile-path.mk

SHELL := /bin/bash

BUILD_DIR  := $(TOP_DIR)/out
TARGET_OUT := $(BUILD_DIR)
export TARGET_OUT

SRC_BASE	:= $(CUR_DIR)/src/base/src
SRC_ALGORITHM	:= $(CUR_DIR)/src/algorithm/src
SRC_SENSOR	:= $(CUR_DIR)/src/sensor/src

BUILD_BASE	:= base
BUILD_ALGORITHM	:= algo
BUILD_SENSOR	:= sensor


all: $(BUILD_BASE) $(BUILD_ALGORITHM) $(BUILD_SENSOR) 

$(BUILD_BASE):
	$(MAKE) -C $(SRC_BASE)
	$(MAKE) -C $(SRC_BASE) install

$(BUILD_ALGORITHM):
	$(MAKE) -C $(SRC_ALGORITHM)
	$(MAKE) -C $(SRC_ALGORITHM) install

$(BUILD_SENSOR):
	$(MAKE) -C $(SRC_SENSOR)
	$(MAKE) -C $(SRC_SENSOR) install

install:
	$(MAKE) -C $(SRC_BASE) install
	$(MAKE) -C $(SRC_ALGORITHM) install
	$(MAKE) -C $(SRC_SENSOR) install

clean:
	-$(MAKE) -C $(SRC_BASE) clean
	-$(MAKE) -C $(SRC_ALGORITHM) clean
	-$(MAKE) -C $(SRC_SENSOR) clean
