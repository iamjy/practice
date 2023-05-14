SOURCES = main.cpp
!defined(QMAKE_CFLAGS_SSE2, var): error("This compiler does not support SSE2")
QMAKE_CXXFLAGS += $$QMAKE_CFLAGS_SSE2
