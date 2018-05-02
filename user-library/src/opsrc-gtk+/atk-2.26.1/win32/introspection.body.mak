Atk-1.0.gir: Atk_1_0_gir_list 
	@-echo Generating $@...
	$(PYTHON) $(G_IR_SCANNER)	\
	--verbose -no-libtool	\
	--namespace=Atk	\
	--nsversion=1.0	\
		\
	--library=atk-1.0	\
		\
	--add-include-path=$(G_IR_INCLUDEDIR)	\
	--include=GObject-2.0	\
	--pkg-export=atk	\
  	\
	--cflags-begin	\
	-I.. -DG_DISABLE_DEPRECATED -DATK_DISABLE_DEPRECATED -DATK_COMPILATION -DATK_LOCALEDIR=\"/dummy/share/locale\"	\
	--cflags-end	\
	--warn-all --c-include atk/atk.h	\
	--filelist=Atk_1_0_gir_list	\
	-o $@

Atk-1.0.typelib: Atk-1.0.gir
	@-echo Compiling $@...
	$(G_IR_COMPILER)	\
	--includedir=. --debug --verbose	\
	Atk-1.0.gir	\
	-o $@

