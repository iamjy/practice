#!/bin/bash

## Inclusion
include build/make_rule/compiler.mk
include build/make_rule/compilepath.mk

## Build directory path
SIGNAL_SRC = $(SRC_DIR)/signal
THREAD_SRC = $(SRC_DIR)/thread

## Build command
BUILD_SIGNAL_EXAM = build_signal_exam
BUILD_THREAD_EXAM = build_thread_exam

all: $(BUILD_SIGNAL_EXAM) $(BUILD_THREAD_EXAM)

build_signal_exam:
	$(MAKE) -C $(SIGNAL_SRC)

build_thread_exam:
	$(MAKE) -C $(THREAD_SRC)

install:
	$(MAKE) -C $(SIGNAL_SRC) install
	$(MAKE) -C $(THREAD_SRC) install

clean:
	$(MAKE) -C $(SIGNAL_SRC) clean
	$(MAKE) -C $(THREAD_SRC) clean
