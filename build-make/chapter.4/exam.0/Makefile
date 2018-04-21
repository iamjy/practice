#!/bin/bash

all:
	cat chapter1 chapter2 chapter3 | spell > Newspell
	if\
		diff Lastspell Newspell > Spellresult;\
	then\
		rm Newspell Spellresult ;\
		echo "No changes in spelling";\
	else\
		mv Newspell Lastspell;\
		echo "Changes found in spelling";\
		cat Spellresult;\
	fi
