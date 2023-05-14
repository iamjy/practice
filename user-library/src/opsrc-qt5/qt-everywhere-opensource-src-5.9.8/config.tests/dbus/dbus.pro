SOURCES = main.cpp
CONFIG += build_all
CONFIG(debug, debug|release): \
    LIBS += $$LIBS_DEBUG
else: \
    LIBS += $$LIBS_RELEASE
