SOURCES = main.cpp
!defined(QMAKE_CFLAGS_SSE4_2, var): error("This compiler does not support SSE4.2")
QMAKE_CXXFLAGS += $$QMAKE_CFLAGS_SSE4_2
