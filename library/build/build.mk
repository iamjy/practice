#!/bin/bash
include build/compiler.mk
include build/compile.mk

SHELL := /bin/bash

TOPDIR := $(PWD)
CURDIR := .
UPDIR  := ..

SRC_DYNAMIC	:= $(CURDIR)/src/dynamic
SRC_STATIC	:= $(CURDIR)/src/static

BUILD_DYNAMIC	:= dynamic
BUILD_STATIC	:= static

all: $(BUILD_DYNAMIC) $(BUILD_STATIC)

$(BUILD_DYNAMIC):
	$(MAKE) -C $(SRC_DYNAMIC)

$(BUILD_STATIC):
	$(MAKE) -C $(SRC_STATIC)
