# The following registers (MiscOut, FeatCont, InputStat[01]) all have there own private
# ports (ie they are accessed directly rather than via indeg reg/data reg
		.set	MiscOut,	0x3c2	# miscilaneous output regsiter (write only)
		.set	MiscOut_R,	0x3cc	# miscilaneous output regsiter (read only)
		.set	FeatCont,	0x3da	# feature control register (color, write only)
		.set	FeatCont_M,	0x3ba	# feature control register (mono, write only)
		.set	FeatCont_R,	0x3ca	# feature control register (read only)
		.set	InputStat0,	0x3c2	# input status 0 register (read only)
		.set	InputStat1,	0x3da	# input status 1 register (color, read only)
		.set	InputStat1_M,0x3ba	# input status 1 register (mono, read only)
# The following registers (Sequencer, CRTC (CRT Controller), Graphics) use an
# index reg/data register pair with the index register being the 'base' port address and
# the data register 'base'+1
		.set	Sequencer,	0x3c4	# sequencer index register
		.set	SequencerData,0x3c5	# seguencer data register
			.set	sReset,		0x00	# Reset index index
			.set	sClockMode,	0x01	# Clocking mode index
			.set	sMapMask,	0x02	# Map mask index
			.set	sCharMap,	0x03	# Character map select index
			.set	sMemMode,	0x04	# Memory mode index

		.set	CRTC,		0x3d4	# CRTC index register (color)
		.set	CRTCData,	0x3d5	# CRTC data register (color)
		.set	CRTC_M,		0x3b4	# CRTC index register (mono)
		.set	CRTCData_M,	0x3b5	# CRTC data register (mono)
			.set	cHrzTotal,	0x00	# horizontal total index (total-5)
			.set	cHrzDispEnd,0x01	# horizontal display end index
			.set	cHrzBlnkStrt,0x02	# horizontal blanking start index
			.set	cHrzBlnkEnd,0x03	# horizontal blanking end index
			.set	cHrzRetrStrt,0x04	# horizontal retrace start index
			.set	cHrzRetrEnd,0x05	# horizontal retrace end index
			.set	cVrtTotal,	0x06	# vertical total index (total-2)
			.set	cOverflow,	0x07	# overflow index
			.set	cPresetRow,	0x08	# preset row scan index
			.set	cMaxScanLn,	0x09	# maximum scan line index
			.set	cCursorStart,0x0a	# cursor start index
			.set	cCursorEnd,	0x0b	# cursor end index
			.set	cStrtAddrHi,0x0c	# start address index (MSB)
			.set	cStrtAddrLo,0x0d	# start address index (LSB)
			.set	cCursorLocHi,0x0e	# cursor location index (MSB)
			.set	cCursorLocLo,0x0f	# cursor location index (LSB)
			.set	cVrtRetrStrt,0x10	# vertical retrace start index
			.set	cVrtRetrEnd,0x11	# vertical retrace end index
			.set	cVrtDispEnd,0x12	# vertical display end index
			.set	cOffset,	0x13	# offset index
			.set	cUnderLine,	0x14	# underline location index
			.set	cVrtBlnkStrt,0x15	# vertical blank start index
			.set	cVrtBlnkEnd,0x16	# vertical blank end index
			.set	cModeControl,0x17	# mode control index
			.set	cLineCompare,0x18	# line compare index

		.set	Graphics,	0x3ce	# graphics controller index index
		.set	GraphicsData,0x3cf	# graphics controller data index
			.set	gSetReset,	0x00	# set/reset index
			.set	gSREnable,	0x01	# set/reset enable index
			.set	gColComp,	0x02	# color compare index
			.set	gDataRot,	0x03	# data rotate index
			.set	gReadMap,	0x04	# read map select index
			.set	gMode,		0x05	# mode index
			.set	gMisc,		0x06	# miscellaneous index
			.set	gColDCare,	0x07	# color don't care index
			.set	gBitMask,	0x08	# bit mask index

# The attribute controller registers are accessed differently once again. The index/data
# register shares the same port address and are selected by first reading the input
# status 1 register (InputStat1) to reset the port, writing the index register and then
# writing the data register.  However, the data is NOT read from the same port and when
# reading the registers, the data read has to be rewritten to the output port (I think)
		.set	AttributeID,0x3c0	# attribute controller index/data register
		.set	AttributeD,	0x3c1	# attribute controller data register for reading
			.set	aPal0,		0x00	# palette index 0
			.set	aPal1,		0x01	# palette index 1
			.set	aPal2,		0x02	# palette index 2
			.set	aPal3,		0x03	# palette index 3
			.set	aPal4,		0x04	# palette index 4
			.set	aPal5,		0x05	# palette index 5
			.set	aPal6,		0x06	# palette index 6
			.set	aPal7,		0x07	# palette index 7
			.set	aPal8,		0x08	# palette index 8
			.set	aPal9,		0x09	# palette index 9
			.set	aPalA,		0x0a	# palette index 10
			.set	aPalB,		0x0b	# palette index 11
			.set	aPalC,		0x0c	# palette index 12
			.set	aPalD,		0x0d	# palette index 13
			.set	aPalE,		0x0e	# palette index 14
			.set	aPalF,		0x0f	# palette index 15
			.set	aModeControl,0x10	# mode control index
			.set	aOScanColor,0x11	# overscan color index
			.set	aColPlnEn,	0x12	# color plane enable index
			.set	aHrzPixPan,	0x13	# horizontal pixel panning index
			.set	aColorSel,	0x14	# color select register

# The color registers are a bit nicer to program (ins/outs can be used). Writing to one
# of the address registers resets the data port to point to the red register for that
# color index. (assuming writing) writing to the data register puts the data into the
# red register and then points the port to the green register. Another write puts the
# data into the green register and causes the port to point to the blue register. One
# last write puts the data into the blue register and the port now points to the red
# register, BUT for the NEXT color.
		.set	ColorWrite,	0x3c8	# color write mode address register (read/write)
		.set	ColorRead,	0x3c7	# color read mode address register (read only?)
		.set	ColorData,	0x3c9	# color data register (red/green/blue, addr++)
