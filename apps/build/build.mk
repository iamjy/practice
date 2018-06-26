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
SRC_PROFILE	:= $(CUR_DIR)/src/profile/src
SRC_SYSTEM	:= $(CUR_DIR)/src/system/src
SRC_BUS		:= $(CUR_DIR)/src/bus/src
SRC_SENSOR	:= $(CUR_DIR)/src/sensor/src
SRC_VIDEO	:= $(CUR_DIR)/src/video/src
SRC_QT		:= $(CUR_DIR)/src/qt/src

BUILD_BASE	:= base
BUILD_ALGORITHM	:= algo
BUILD_PROFILE	:= prof
BUILD_SYSTEM	:= sys
BUILD_BUS	:= bus
BUILD_SENSOR	:= sensor
BUILD_VIDEO	:= video
BUILD_QT	:= qt

all: $(BUILD_BASE) $(BUILD_ALGORITHM) $(BUILD_PROFILE) $(BUILD_SYSTEM) $(BUILD_BUS) $(BUILD_SENSOR) $(BUILD_VIDEO) $(BUILD_QT)

$(BUILD_BASE):
	$(MAKE) -C $(SRC_BASE)
	$(MAKE) -C $(SRC_BASE) install

$(BUILD_ALGORITHM):
	$(MAKE) -C $(SRC_ALGORITHM)
	$(MAKE) -C $(SRC_ALGORITHM) install

$(BUILD_PROFILE):
	$(MAKE) -C $(SRC_PROFILE)
	$(MAKE) -C $(SRC_PROFILE) install

$(BUILD_SYSTEM):
	$(MAKE) -C $(SRC_SYSTEM)
	$(MAKE) -C $(SRC_SYSTEM) install

$(BUILD_BUS):
	$(MAKE) -C $(SRC_BUS)
	$(MAKE) -C $(SRC_BUS) install

$(BUILD_SENSOR):
	$(MAKE) -C $(SRC_SENSOR)
	$(MAKE) -C $(SRC_SENSOR) install

$(BUILD_VIDEO):
	$(MAKE) -C $(SRC_VIDEO)
	$(MAKE) -C $(SRC_VIDEO) install

$(BUILD_QT):
	$(MAKE) -C $(SRC_QT)
	$(MAKE) -C $(SRC_QT) install

install:
	$(MAKE) -C $(SRC_BASE) install
	$(MAKE) -C $(SRC_ALGORITHM) install
	$(MAKE) -C $(SRC_PROFILE) install
	$(MAKE) -C $(SRC_SYSTEM) install
	$(MAKE) -C $(SRC_BUS) install
	$(MAKE) -C $(SRC_SENSOR) install
	$(MAKE) -C $(SRC_VIDEO) install
	$(MAKE) -C $(SRC_QT) install

clean:
	-$(MAKE) -C $(SRC_BASE) clean
	-$(MAKE) -C $(SRC_ALGORITHM) install
	-$(MAKE) -C $(SRC_PROFILE) install
	-$(MAKE) -C $(SRC_SYSTEM) install
	-$(MAKE) -C $(SRC_BUS) clean
	-$(MAKE) -C $(SRC_SENSOR) clean
	-$(MAKE) -C $(SRC_VIDEO) install
	-$(MAKE) -C $(SRC_QT) clean
