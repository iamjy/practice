SOURCES = main.cpp
!defined(QMAKE_CFLAGS_F16C, var): error("This compiler does not support F16C")
QMAKE_CXXFLAGS += $$QMAKE_CFLAGS_F16C
