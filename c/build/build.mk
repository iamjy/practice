#!/bin/bash
include build/compiler.mk
include build/compile.mk

SHELL := /bin/bash

TOPDIR := $(PWD)
CURDIR := .
UPDIR  := ..

BUILD_OUT  := $(TOPDIR)/out
TARGET_OUT := $(BUILD_OUT)
export TARGET_OUT

SRC_KEYWORD	:= $(CURDIR)/src/keyword
SRC_POINTER	:= $(CURDIR)/src/pointer
SRC_FUNCTION	:= $(CURDIR)/src/function
SRC_LIBSTD	:= $(CURDIR)/src/libstd

BUILD_KEYWORD	:= keyword
BUILD_POINTER	:= pointer
BUILD_FUNCTION	:= function
BUILD_LIBSTD	:= libstd

all: $(BUILD_LIBSTD) $(BUILD_KEYWORD) $(BUILD_POINTER) $(BUILD_FUNCTION)

$(BUILD_LIBSTD):
	$(MAKE) -C $(SRC_LIBSTD)

$(BUILD_KEYWORD):
	$(MAKE) -C $(SRC_KEYWORD)

$(BUILD_POINTER):
	$(MAKE) -C $(SRC_POINTER)

$(BUILD_FUNCTION):
	$(MAKE) -C $(SRC_FUNCTION)


