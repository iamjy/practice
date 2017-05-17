#!/bin/bash
SHELL := /bin/bash

TOPDIR := $(PWD)
CURDIR := .
UPDIR  := ..

BUILD_OUT  := $(TOPDIR)/out
TARGET_OUT := $(BUILD_OUT)
export TARGET_OUT

AS := $(TARGET_TOOLCHAIN)as
LD := $(TARGET_TOOLCHAIN)ld
CC := $(TARGET_TOOLCHAIN)gcc
CXX := $(TARGET_TOOLCHAIN)g++
CPP := $(CC) -E
AR := $(TARGET_TOOLCHAIN)ar rscv
NM := $(TARGET_TOOLCHAIN)nm
LDR := $(TARGET_TOOLCHAIN)ldr
STRIP := $(TARGET_TOOLCHAIN)strip
OBJCOPY := $(TARGET_TOOLCHAIN)objcopy
OBJDUMP := $(TARGET_TOOLCHAIN)objdump
RANLIB := $(TARGET_TOOLCHAIN)ranlib
export AS LD CC CXX CPP AR NM LDR STRIP OBJCOPY OBJDUMP RANLIB

all:
	$(MAKE) -C ./time
