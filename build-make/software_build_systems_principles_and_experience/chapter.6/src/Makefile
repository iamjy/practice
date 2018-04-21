_subidrs :=
_curdirs :=

FRAMEWORK := $(CURDIR)/make/framework.mk
include Files.mk
include $(FRAMEWORK)

VARS := $(sort $(filter srcs-% cflags-%, $(.VARIABLES)))
$(foreach var, $(VARS), $(info $(var) = $($(var))))

.PHONY: all
all:
	@# donothing
	@#echo $(SUBDIRS)
	@#echo $(_subdirs)
