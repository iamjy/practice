#!/bin/bash
include build/make-rule/compiler.mk
include build/make-rule/compilepath.mk

SHELL := /bin/bash

SRC_BASE        := $(CUR_DIR)/src/base
SRC_COMMON	:= $(CUR_DIR)/src/common/src
SRC_DYNAMIC	:= $(CUR_DIR)/src/dynamic
SRC_STATIC	:= $(CUR_DIR)/src/static
SRC_SHM		:= $(CUR_DIR)/src/shm
SRC_TEST	:= $(CUR_DIR)/src/test
SRC_LIST0511	:= $(CUR_DIR)/src/list0511
SRC_LIST0513	:= $(CUR_DIR)/src/list0513
SRC_LIST0612	:= $(CUR_DIR)/src/list0612
SRC_LIST0622	:= $(CUR_DIR)/src/list0622
SRC_LIST0721	:= $(CUR_DIR)/src/list0721

BUILD_BASE	:= base
BUILD_COMMON	:= common
BUILD_DYNAMIC	:= dynamic
BUILD_STATIC	:= static
BUILD_SHM	:= shm
BUILD_TEST	:= test
BUILD_LIST0511	:= list0511
BUILD_LIST0513	:= list0513
BUILD_LIST0612	:= list0612
BUILD_LIST0622	:= list0622
BUILD_LIST0721	:= list0721

all: $(BUILD_BASE) $(BUILD_COMMON) $(BUILD_DYNAMIC) $(BUILD_STATIC) $(BUILD_SHM) $(BUILD_TEST) $(BUILD_LIST0511) $(BUILD_LIST0513) $(BUILD_LIST0612) $(BUILD_LIST0622)

$(BUILD_BASE):
	$(MAKE) -C $(SRC_BASE)

$(BUILD_COMMON):
	$(MAKE) -C $(SRC_COMMON) $$1
	$(MAKE) -C $(SRC_COMMON) install

$(BUILD_DYNAMIC):
	$(MAKE) -C $(SRC_DYNAMIC)

$(BUILD_STATIC):
	$(MAKE) -C $(SRC_STATIC)

$(BUILD_SHM):
	$(MAKE) -C $(SRC_SHM)

$(BUILD_TEST):
	$(MAKE) -C $(SRC_TEST)

$(BUILD_LIST0511):
	$(MAKE) -C $(SRC_LIST0511)

$(BUILD_LIST0513):
	$(MAKE) -C $(SRC_LIST0513)

$(BUILD_LIST0612):
	$(MAKE) -C $(SRC_LIST0612)

$(BUILD_LIST0622):
	$(MAKE) -C $(SRC_LIST0622)

$(BUILD_LIST0721):
	$(MAKE) -C $(SRC_LIST0721)

base-install:
	$(MAKE) -C $(SRC_BASE) install

common-install:
	$(MAKE) -C $(SRC_COMMON) install

install:
	$(MAKE) -C $(SRC_BASE) install
	$(MAKE) -C $(SRC_COMMON) install
	$(MAKE) -C $(SRC_DYNAMIC) install
	$(MAKE) -C $(SRC_STATIC) install
	$(MAKE) -C $(SRC_SHM) install
	$(MAKE) -C $(SRC_TEST) install
	$(MAKE) -C $(SRC_LIST0511) install
	$(MAKE) -C $(SRC_LIST0513) install
	$(MAKE) -C $(SRC_LIST0612) install
	$(MAKE) -C $(SRC_LIST0622) install

base-clean:
	-$(MAKE) -C $(SRC_BASE) clean

common-clean:
	-$(MAKE) -C $(SRC_COMMON) clean

clean:
	-$(MAKE) -C $(SRC_BASE) clean
	-$(MAKE) -C $(SRC_COMMON) clean
	-$(MAKE) -C $(SRC_DYNAMIC) clean
	-$(MAKE) -C $(SRC_STATIC) clean
	-$(MAKE) -C $(SRC_SHM) clean
	-$(MAKE) -C $(SRC_TEST) clean
	-$(MAKE) -C $(SRC_LIST0511) clean
	-$(MAKE) -C $(SRC_LIST0513) clean
	-$(MAKE) -C $(SRC_LIST0612) clean
	-$(MAKE) -C $(SRC_LIST0622) clean
