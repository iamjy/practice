SOURCES = main.cpp
TEMPLATE = lib
CONFIG += dll bsymbolic_functions
isEmpty(QMAKE_LFLAGS_BSYMBOLIC_FUNC): error("Nope")
