project (custom_command)
cmake_minimum_required (VERSION 2.6)

set (input_data_file $(PROJECT_SOURCE_DIR)/data.dat)
set (output_c_file data.c)

add_custom_command (
	OUTPUT $(output_c_file)
	COMMAND /tools/bin/make-data-file
		< $(input_data_file)
		> $(output_c_file)
	DEPENDS $(input_data_file)
)

add_executable (print-data $(output_c_file))

$(output_c_file) : $(input_data_file)
	/tools/bin/make-data-file < $(input_data_file) > $(output_c_file)

