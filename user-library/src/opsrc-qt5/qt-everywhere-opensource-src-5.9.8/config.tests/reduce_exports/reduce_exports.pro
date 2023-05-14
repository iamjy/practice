SOURCES = main.cpp
TEMPLATE = lib
CONFIG += dll hide_symbols
isEmpty(QMAKE_CFLAGS_HIDESYMS): error("Nope")
