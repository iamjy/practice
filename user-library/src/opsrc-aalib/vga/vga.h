#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
	unsigned char
		miscOut,
		featCont;
} vgaGeneralRegs;

typedef struct {
	unsigned char
		clockMode,
		mapMask,
		charMap,
		memMode,
		reset,
		index;
} vgaSequencerRegs;

typedef struct {
	unsigned char
		horizontalTotal,
		horizontalDisplayEnd,
		horizontalBlankStart,
		horizontalBlankEnd,
		horizontalRetraceStart,
		horizontalRetraceEnd,
		verticalTotal,
		overflow,
		presetRowScan,
		maxScanLine,
		cursorStart,
		cursorEnd,
		startAddrHi,
		startAddrLo,
		cursorAddrHi,
		cursorAddrLo,
		verticalRetraceStart,
		verticalRetraceEnd,
		verticalDisplayEnd,
		offset,
		underlineLocation,
		verticalBlankStart,
		verticalBlankEnd,
		modeControl,
		lineControl,
		index;
} vgaCRTControllerRegs;

typedef struct {
	unsigned char
		setReset,
		srEnable,
		colorCompare,
		dataRotate,
		readMap,
		mode,
		misc,
		colorDontCare,
		bitMask,
		index;
} vgaGraphicsRegs;

typedef struct {
	unsigned char
		colorPalette[16],
		modeControl,
		overscanColor,
		colorPlaneEnable,
		horizontalPixelPanning,
		colorSelect,
		index;
} vgaAttributeRegs;

typedef struct {
	struct {
		unsigned char
			red,
			green,
			blue;
	} colors[256];
	unsigned char status;	/* read from PEL  Address Write Mode Register (0x3c8) */
} vgaPaletteRegs;

typedef struct {
	vgaGeneralRegs generalRegs;
	vgaSequencerRegs sequencerRegs;
	vgaCRTControllerRegs CRTControllerRegs;
	vgaGraphicsRegs graphicsRegs;
	vgaAttributeRegs attributeRegs;
	vgaPaletteRegs paletteRegs;
} vgaRegs;

typedef struct {
	unsigned char screenData[30];
	unsigned char displayData[7];
} vgaBiosData;

typedef struct {
	vgaRegs regs;
	vgaBiosData biosData;
} vgaRegsBiosState;

/* all the following functions return the UPDATED pointer (so you can chain the calls,
 * which (Save|Restore)Regs does
 */
void *vgaRestoreAttributeRegs(vgaAttributeRegs *buf);
void *vgaRestoreBiosData(vgaBiosData *data);					/* uses fs */
void *vgaRestoreCRTControllerRegs(vgaCRTControllerRegs *buf);
void *vgaRestoreGeneralRegs(vgaGeneralRegs *buf);
void *vgaRestoreGraphicsRegs(vgaGraphicsRegs *buf);
void *vgaRestorePaletteRegs(vgaPaletteRegs *buf);
void *vgaRestoreRegs(vgaRegs *buf);
void *vgaRestoreRegsBiosState(vgaRegsBiosState *buf);
void *vgaRestoreSequencerRegs(vgaSequencerRegs *buf);

void *vgaSaveAttributeRegs(vgaAttributeRegs *buf);
void *vgaSaveBiosData(vgaBiosData *data);						/* uses fs */
void *vgaSaveCRTControllerRegs(vgaCRTControllerRegs *buf);
void *vgaSaveGeneralRegs(vgaGeneralRegs *buf);
void *vgaSaveGraphicsRegs(vgaGraphicsRegs *buf);
void *vgaSavePaletteRegs(vgaPaletteRegs *buf);
void *vgaSaveRegs(vgaRegs *buf);
void *vgaSaveRegsBiosState(vgaRegsBiosState *buf);
void *vgaSaveSequencerRegs(vgaSequencerRegs *buf);

#ifdef __cplusplus
}
#endif
