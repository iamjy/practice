srcs-$(_curdir) := $(addprefix $(_curdir), $(SRC))
cflags-$(_curdir) := $(CFLAGS)
_subdirs := $(_subdirs) $(addprefix $(_subdir), $(SUBDIRS))

ifneq ($(words $(_subdirs)), 0)
	_curdir := $(firstword $(_subdirs))/
	_subdirs := $(wordlist 2, $(words $(_subdirs)), $(_subdirs))
	SUBDIRS :=
	SRC :=
	CFLAGS :=
	include $(_curdir)Files.mk
	include $(FRAMEWORK)
endif
