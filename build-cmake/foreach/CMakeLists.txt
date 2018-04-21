project (foreach)
cmake_minimum_required (VERSION 2.6)

foreach (source_file add.c sub.c mult.c calc.c)
	message ("Calculating cksum for ${source_file}")
	add_custom_target (cksum-${source_file} ALL
		COMMAND cksum ${PROJECT_SOURCE_DIR}/${source_file})
endforeach (source_file)
