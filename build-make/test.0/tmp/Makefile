JPI=4
JPJ=2

#With Double-dollar
JPIJ_1 = $(shell echo $$(( $(JPI) + $(JPJ) )))

#With 'expr'
JPIJ_2 = $(shell expr $(JPI) + $(JPJ) )

$(info Sum with Double-$$: $(JPIJ_1))
$(info Sum with 'expr': $(JPIJ_2))

all:
	echo $(JPIJ_1)
