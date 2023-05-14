SOURCES = main.cpp
!defined(QMAKE_CFLAGS_SSE3, var): error("This compiler does not support SSE3")
QMAKE_CXXFLAGS += $$QMAKE_CFLAGS_SSE3
