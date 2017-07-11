#!/bin/bash

include ./build/compiler.mk
include ./build/compile.mk

SHELL := /bin/bash

TOPDIR := $(PWD)
CURDIR := .
UPDIR  := ..

BUILD_OUT  := $(TOPDIR)/out
TARGET_OUT := $(BUILD_OUT)
export TARGET_OUT

SRC_POINTER	:= $(CURDIR)/src/pointer
SRC_FUNCTION	:= $(CURDIR)/src/function
SRC_KEYWORD	:= $(CURDIR)/src/keyword

BUILD_POINTER	:= pointer
BUILD_FUNCTION	:= function
BUILD_KEYWORD	:= keyword

all: $(BUILD_POINTER) $(BUILD_FUNCTION) $(BUILD_KEYWORD)

$(BUILD_POINTER):
	$(MAKE) -C $(SRC_POINTER)

$(BUILD_FUNCTION):
	$(MAKE) -C $(SRC_FUNCTION)

$(BUILD_KEYWORD):
	$(MAKE) -C $(SRC_KEYWORD)
