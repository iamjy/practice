SOURCES = main.cpp
!defined(QMAKE_CFLAGS_SSE4_1, var): error("This compiler does not support SSE4.1")
QMAKE_CXXFLAGS += $$QMAKE_CFLAGS_SSE4_1
