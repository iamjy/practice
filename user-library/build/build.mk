#!/bin/bash
include build/make_rule/compiler.mk
include build/make_rule/compilepath.mk

SHELL := /bin/bash

TOPDIR := $(PWD)
CURDIR := .
UPDIR  := ..

SRC_DYNAMIC	:= $(CURDIR)/src/dynamic
SRC_STATIC	:= $(CURDIR)/src/static
SRC_LIST0511	:= $(CURDIR)/src/list0511
SRC_LIST0513	:= $(CURDIR)/src/list0513
SRC_LIST0612	:= $(CURDIR)/src/list0612
SRC_LIST0622	:= $(CURDIR)/src/list0622
SRC_LIST0721	:= $(CURDIR)/src/list0721
SRC_SHM		:= $(CURDIR)/src/shm
SRC_TEST	:= $(CURDIR)/src/test

BUILD_DYNAMIC	:= dynamic
BUILD_STATIC	:= static
BUILD_LIST0511	:= list0511
BUILD_LIST0513	:= list0513
BUILD_LIST0612	:= list0612
BUILD_LIST0622	:= list0622
BUILD_LIST0721	:= list0721
BUILD_SHM	:= shm
BUILD_TEST	:= test

all: $(BUILD_DYNAMIC) $(BUILD_STATIC) $(BUILD_LIST0511) $(BUILD_LIST0513) $(BUILD_LIST0612) $(BUILD_LIST0622) $(BUILD_TEST) $(BUILD_SHM)
$(BUILD_DYNAMIC):
	$(MAKE) -C $(SRC_DYNAMIC)

$(BUILD_STATIC):
	$(MAKE) -C $(SRC_STATIC)

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

$(BUILD_SHM):
	$(MAKE) -C $(SRC_SHM)

$(BUILD_TEST):
	$(MAKE) -C $(SRC_TEST)

install:
	$(MAKE) -C $(SRC_DYNAMIC) install
	$(MAKE) -C $(SRC_STATIC) install
	$(MAKE) -C $(SRC_LIST0511) install
	$(MAKE) -C $(SRC_LIST0513) install
	$(MAKE) -C $(SRC_LIST0612) install
	$(MAKE) -C $(SRC_LIST0622) install
	$(MAKE) -C $(SRC_SHM) install
	$(MAKE) -C $(SRC_TEST) install

clean:
	$(MAKE) -C $(SRC_DYNAMIC) clean
	$(MAKE) -C $(SRC_STATIC) clean
	$(MAKE) -C $(SRC_LIST0511) clean
	$(MAKE) -C $(SRC_LIST0513) clean
	$(MAKE) -C $(SRC_LIST0612) clean
	$(MAKE) -C $(SRC_LIST0622) clean
	$(MAKE) -C $(SRC_SHM) clean
	$(MAKE) -C $(SRC_TEST) clean
