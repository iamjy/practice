SOURCES = main.cpp
!defined(QMAKE_CFLAGS_AVX, var): error("This compiler does not support AVX")
QMAKE_CXXFLAGS += $$QMAKE_CFLAGS_AVX
