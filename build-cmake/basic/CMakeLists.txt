cmake_minimum_required(VERSION 3.5)

#add_executable(a.out main.c foo.c bar.c)
#add_library(libfoo SHARED foo.c bar.c)
#add_library(libbar STATIC foo.c bar.c)

add_library(archive OBJECT foo.c bar.c)
target_include_directories(archive PRIVATE
	./include
)
add_library(archiveExtras STATIC $<TARGET_OBJECTS:archive> extras.c)
target_include_directories(archiveExtras PRIVATE
	./include
)
add_executable(main $<TARGET_OBJECTS:archive> main.c)
target_include_directories(main PRIVATE
	./include
)
