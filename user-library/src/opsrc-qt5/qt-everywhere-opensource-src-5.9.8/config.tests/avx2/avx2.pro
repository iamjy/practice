SOURCES = main.cpp
!defined(QMAKE_CFLAGS_AVX2, var): error("This compiler does not support AVX2")
QMAKE_CXXFLAGS += $$QMAKE_CFLAGS_AVX2
