
/****************************************************************************
#	 	Photobit Pb0330 MI0360 library                              #
# 		Copyright (C) 2004 Michel Xhaard   mxhaard@magic.fr         #
#                                                                           #
# This program is free software; you can redistribute it and/or modify      #
# it under the terms of the GNU General Public License as published by      #
# the Free Software Foundation; either version 2 of the License, or         #
# (at your option) any later version.                                       #
#                                                                           #
# This program is distributed in the hope that it will be useful,           #
# but WITHOUT ANY WARRANTY; without even the implied warranty of            #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             #
# GNU General Public License for more details.                              #
#                                                                           #
# You should have received a copy of the GNU General Public License         #
# along with this program; if not, write to the Free Software               #
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA #
#                                                                           #
****************************************************************************/
/* Aurelien setting from snoop */
static __u16 pb03303x_start_data[][3] = {
    {0xa0, 0x01, 0x0000},
    {0xa0, 0x03, 0x0008},
    {0xa0, 0x0a, 0x0010},
    {0xa0, 0x10, 0x0002},
    {0xa0, 0x02, 0x0003},
    {0xa0, 0x80, 0x0004},
    {0xa0, 0x01, 0x0005},
    {0xa0, 0xe0, 0x0006},
    {0xa0, 0xdc, 0x008b},	//8b -> dc
    {0xa0, 0x01, 0x0001},
    {0xa0, 0x03, 0x0012},
    {0xa0, 0x01, 0x0012},
    {0xa0, 0x00, 0x0098},
    {0xa0, 0x00, 0x009a},
    {0xa0, 0x00, 0x011a},
    {0xa0, 0x00, 0x011c},
    {0xa0, 0xdc, 0x008b},
    {0xa0, 0x01, 0x0092},
    {0xa0, 0x01, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x06, 0x0092},
    {0xa0, 0x00, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x08, 0x0092},
    {0xa0, 0x83, 0x0093},
    {0xa0, 0x04, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x01, 0x0092},
    {0xa0, 0x04, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x08, 0x0092},
    {0xa0, 0x06, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x02, 0x0092},
    {0xa0, 0x11, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x03, 0x0092},
    {0xa0, 0xe7, 0x0093},
    {0xa0, 0x01, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x04, 0x0092},
    {0xa0, 0x87, 0x0093},
    {0xa0, 0x02, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x07, 0x0092},
    {0xa0, 0x02, 0x0093},
    {0xa0, 0x30, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x20, 0x0092},
    {0xa0, 0x00, 0x0093},
    {0xa0, 0x11, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x35, 0x0092},
    {0xa0, 0x50, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x30, 0x0092},
    {0xa0, 0x05, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x31, 0x0092},
    {0xa0, 0x00, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x58, 0x0092},
    {0xa0, 0x78, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x62, 0x0092},
    {0xa0, 0x11, 0x0093},
    {0xa0, 0x04, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x2b, 0x0092},
    {0xa0, 0x28, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x2c, 0x0092},
    {0xa0, 0x30, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x2d, 0x0092},
    {0xa0, 0x30, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x2e, 0x0092},
    {0xa0, 0x28, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x10, 0x0087},
    {0xa0, 0x37, 0x0101},
    {0xa0, 0x05, 0x0012},
    {0xa0, 0x0d, 0x0100},
    {0xa0, 0x06, 0x0189},
    {0xa0, 0x00, 0x01ad},
    {0xa0, 0x03, 0x01c5},
    {0xa0, 0x13, 0x01cb},
    {0xa0, 0x08, 0x0250},
    {0xa0, 0x08, 0x0301},
    {0xa0, 0x60, 0x01a8},
    {0xa0, 0x78, 0x018d},
    {0xa0, 0x61, 0x0116},
    {0xa0, 0x65, 0x0118},

    {0xa1, 0x01, 0x0002},
    {0xa0, 0x09, 0x01ad},
    {0xa0, 0x15, 0x01ae},
    {0xa0, 0x0d, 0x003a},
    {0xa0, 0x02, 0x003b},
    {0xa0, 0x00, 0x0038},
    {0xa0, 0x50, 0x010a},
    {0xa0, 0xf8, 0x010b},
    {0xa0, 0xf8, 0x010c},
    {0xa0, 0xf8, 0x010d},
    {0xa0, 0x50, 0x010e},
    {0xa0, 0xf8, 0x010f},
    {0xa0, 0xf8, 0x0110},
    {0xa0, 0xf8, 0x0111},
    {0xa0, 0x50, 0x0112},

    {0xa1, 0x01, 0x0008},
    {0xa0, 0x03, 0x0008},
    {0xa0, 0x08, 0x01c6},

    {0xa1, 0x01, 0x01c8},

    {0xa1, 0x01, 0x01c9},

    {0xa1, 0x01, 0x01ca},
    {0xa0, 0x0f, 0x01cb},
    {0xa0, 0x13, 0x0120},
    {0xa0, 0x38, 0x0121},
    {0xa0, 0x59, 0x0122},
    {0xa0, 0x79, 0x0123},
    {0xa0, 0x92, 0x0124},
    {0xa0, 0xa7, 0x0125},
    {0xa0, 0xb9, 0x0126},
    {0xa0, 0xc8, 0x0127},
    {0xa0, 0xd4, 0x0128},
    {0xa0, 0xdf, 0x0129},
    {0xa0, 0xe7, 0x012a},
    {0xa0, 0xee, 0x012b},
    {0xa0, 0xf4, 0x012c},
    {0xa0, 0xf9, 0x012d},
    {0xa0, 0xfc, 0x012e},
    {0xa0, 0xff, 0x012f},
    {0xa0, 0x26, 0x0130},
    {0xa0, 0x22, 0x0131},
    {0xa0, 0x20, 0x0132},
    {0xa0, 0x1c, 0x0133},
    {0xa0, 0x16, 0x0134},
    {0xa0, 0x13, 0x0135},
    {0xa0, 0x10, 0x0136},
    {0xa0, 0x0d, 0x0137},
    {0xa0, 0x0b, 0x0138},
    {0xa0, 0x09, 0x0139},
    {0xa0, 0x07, 0x013a},
    {0xa0, 0x06, 0x013b},
    {0xa0, 0x05, 0x013c},
    {0xa0, 0x04, 0x013d},
    {0xa0, 0x03, 0x013e},
    {0xa0, 0x02, 0x013f},
    {0xa0, 0x50, 0x010a},
    {0xa0, 0xf8, 0x010b},
    {0xa0, 0xf8, 0x010c},
    {0xa0, 0xf8, 0x010d},
    {0xa0, 0x50, 0x010e},
    {0xa0, 0xf8, 0x010f},
    {0xa0, 0xf8, 0x0110},
    {0xa0, 0xf8, 0x0111},
    {0xa0, 0x50, 0x0112},

    {0xa1, 0x01, 0x0180},
    {0xa0, 0x00, 0x0180},
    {0xa0, 0x00, 0x0180},
    {0xa0, 0x00, 0x0019},
    {0xa0, 0x05, 0x0092},
    {0xa0, 0x09, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x09, 0x0092},
    {0xa0, 0x34, 0x0093},
    {0xa0, 0x01, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x00, 0x0190},
    {0xa0, 0x07, 0x0191},
    {0xa0, 0xec, 0x0192},
    {0xa0, 0x00, 0x0195},
    {0xa0, 0x00, 0x0196},
    {0xa0, 0x9c, 0x0197},
    {0xa0, 0x0e, 0x018c},
    {0xa0, 0x1c, 0x018f},
    {0xa0, 0x14, 0x01a9},
    {0xa0, 0x24, 0x01aa},
    {0xa0, 0xd7, 0x001d},
    {0xa0, 0xf4, 0x001e},
    {0xa0, 0xf9, 0x001f},
    {0xa0, 0xff, 0x0020},
    {0xa0, 0x42, 0x0180},
    {0xa0, 0x09, 0x01ad},
    {0xa0, 0x15, 0x01ae},
    {0xa0, 0x40, 0x0180},
    {0xa1, 0x01, 0x0180},
    {0xa0, 0x42, 0x0180},
    {0, 0, 0}
};

static __u16 pb03303x_scale_data[][3] = {
    {0xa0, 0x01, 0x0000},
    {0xa0, 0x03, 0x0008},
    {0xa0, 0x0a, 0x0010},
    {0xa0, 0x00, 0x0002},
    {0xa0, 0x02, 0x0003},
    {0xa0, 0x80, 0x0004},
    {0xa0, 0x01, 0x0005},
    {0xa0, 0xe0, 0x0006},
    {0xa0, 0xdc, 0x008b},	//8b -> dc
    {0xa0, 0x01, 0x0001},
    {0xa0, 0x03, 0x0012},
    {0xa0, 0x01, 0x0012},
    {0xa0, 0x00, 0x0098},
    {0xa0, 0x00, 0x009a},
    {0xa0, 0x00, 0x011a},
    {0xa0, 0x00, 0x011c},
    {0xa0, 0xdc, 0x008b},
    {0xa0, 0x01, 0x0092},
    {0xa0, 0x01, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x06, 0x0092},
    {0xa0, 0x00, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x08, 0x0092},
    {0xa0, 0x83, 0x0093},
    {0xa0, 0x04, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x01, 0x0092},
    {0xa0, 0x04, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x08, 0x0092},
    {0xa0, 0x06, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x02, 0x0092},
    {0xa0, 0x11, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x03, 0x0092},
    {0xa0, 0xe7, 0x0093},
    {0xa0, 0x01, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x04, 0x0092},
    {0xa0, 0x87, 0x0093},
    {0xa0, 0x02, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x07, 0x0092},
    {0xa0, 0x02, 0x0093},
    {0xa0, 0x30, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x20, 0x0092},
    {0xa0, 0x00, 0x0093},
    {0xa0, 0x11, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x35, 0x0092},
    {0xa0, 0x50, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x30, 0x0092},
    {0xa0, 0x05, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x31, 0x0092},
    {0xa0, 0x00, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x58, 0x0092},
    {0xa0, 0x78, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x62, 0x0092},
    {0xa0, 0x11, 0x0093},
    {0xa0, 0x04, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x2b, 0x0092},
    {0xa0, 0x28, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x2c, 0x0092},
    {0xa0, 0x30, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x2d, 0x0092},
    {0xa0, 0x30, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x2e, 0x0092},
    {0xa0, 0x28, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x10, 0x0087},
    {0xa0, 0x37, 0x0101},
    {0xa0, 0x05, 0x0012},
    {0xa0, 0x0d, 0x0100},
    {0xa0, 0x06, 0x0189},
    {0xa0, 0x00, 0x01ad},
    {0xa0, 0x03, 0x01c5},
    {0xa0, 0x13, 0x01cb},
    {0xa0, 0x08, 0x0250},
    {0xa0, 0x08, 0x0301},
    {0xa0, 0x60, 0x01a8},
    {0xa0, 0x78, 0x018d},
    {0xa0, 0x61, 0x0116},
    {0xa0, 0x65, 0x0118},

    {0xa1, 0x01, 0x0002},
    {0xa0, 0x09, 0x01ad},
    {0xa0, 0x15, 0x01ae},
    {0xa0, 0x0d, 0x003a},
    {0xa0, 0x02, 0x003b},
    {0xa0, 0x00, 0x0038},
    {0xa0, 0x50, 0x010a},
    {0xa0, 0xf8, 0x010b},
    {0xa0, 0xf8, 0x010c},
    {0xa0, 0xf8, 0x010d},
    {0xa0, 0x50, 0x010e},
    {0xa0, 0xf8, 0x010f},
    {0xa0, 0xf8, 0x0110},
    {0xa0, 0xf8, 0x0111},
    {0xa0, 0x50, 0x0112},

    {0xa1, 0x01, 0x0008},
    {0xa0, 0x03, 0x0008},
    {0xa0, 0x08, 0x01c6},

    {0xa1, 0x01, 0x01c8},

    {0xa1, 0x01, 0x01c9},

    {0xa1, 0x01, 0x01ca},
    {0xa0, 0x0f, 0x01cb},
    {0xa0, 0x13, 0x0120},
    {0xa0, 0x38, 0x0121},
    {0xa0, 0x59, 0x0122},
    {0xa0, 0x79, 0x0123},
    {0xa0, 0x92, 0x0124},
    {0xa0, 0xa7, 0x0125},
    {0xa0, 0xb9, 0x0126},
    {0xa0, 0xc8, 0x0127},
    {0xa0, 0xd4, 0x0128},
    {0xa0, 0xdf, 0x0129},
    {0xa0, 0xe7, 0x012a},
    {0xa0, 0xee, 0x012b},
    {0xa0, 0xf4, 0x012c},
    {0xa0, 0xf9, 0x012d},
    {0xa0, 0xfc, 0x012e},
    {0xa0, 0xff, 0x012f},
    {0xa0, 0x26, 0x0130},
    {0xa0, 0x22, 0x0131},
    {0xa0, 0x20, 0x0132},
    {0xa0, 0x1c, 0x0133},
    {0xa0, 0x16, 0x0134},
    {0xa0, 0x13, 0x0135},
    {0xa0, 0x10, 0x0136},
    {0xa0, 0x0d, 0x0137},
    {0xa0, 0x0b, 0x0138},
    {0xa0, 0x09, 0x0139},
    {0xa0, 0x07, 0x013a},
    {0xa0, 0x06, 0x013b},
    {0xa0, 0x05, 0x013c},
    {0xa0, 0x04, 0x013d},
    {0xa0, 0x03, 0x013e},
    {0xa0, 0x02, 0x013f},
    {0xa0, 0x50, 0x010a},
    {0xa0, 0xf8, 0x010b},
    {0xa0, 0xf8, 0x010c},
    {0xa0, 0xf8, 0x010d},
    {0xa0, 0x50, 0x010e},
    {0xa0, 0xf8, 0x010f},
    {0xa0, 0xf8, 0x0110},
    {0xa0, 0xf8, 0x0111},
    {0xa0, 0x50, 0x0112},

    {0xa1, 0x01, 0x0180},
    {0xa0, 0x00, 0x0180},
    {0xa0, 0x00, 0x0180},
    {0xa0, 0x00, 0x0019},
    {0xa0, 0x05, 0x0092},
    {0xa0, 0x09, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x09, 0x0092},
    {0xa0, 0x34, 0x0093},
    {0xa0, 0x01, 0x0094},
    {0xa0, 0x01, 0x0090},

    {0xa1, 0x01, 0x0091},
    {0xa0, 0x00, 0x0190},
    {0xa0, 0x07, 0x0191},
    {0xa0, 0xec, 0x0192},
    {0xa0, 0x00, 0x0195},
    {0xa0, 0x00, 0x0196},
    {0xa0, 0x9c, 0x0197},
    {0xa0, 0x0e, 0x018c},
    {0xa0, 0x1c, 0x018f},
    {0xa0, 0x14, 0x01a9},
    {0xa0, 0x24, 0x01aa},
    {0xa0, 0xd7, 0x001d},
    {0xa0, 0xf4, 0x001e},
    {0xa0, 0xf9, 0x001f},
    {0xa0, 0xff, 0x0020},
    {0xa0, 0x42, 0x0180},
    {0xa0, 0x09, 0x01ad},
    {0xa0, 0x15, 0x01ae},
    {0xa0, 0x40, 0x0180},
    {0xa1, 0x01, 0x0180},
    {0xa0, 0x42, 0x0180},
    {0, 0, 0}
};
static __u16 pb0330xx_start_data[][3] = {
    {0xa1, 0x01, 0x0008},
    {0xa1, 0x01, 0x0008},
    {0xa0, 0x01, 0x0000},
    {0xa0, 0x03, 0x0008},	//00
    {0xa0, 0x0a, 0x0010},
    {0xa0, 0x10, 0x0002},
    {0xa0, 0x02, 0x0003},
    {0xa0, 0x80, 0x0004},
    {0xa0, 0x01, 0x0005},
    {0xa0, 0xe0, 0x0006},
    {0xa0, 0x01, 0x0001},
    {0xa0, 0x05, 0x0012},
    {0xa0, 0x07, 0x0012},
    {0xa0, 0x00, 0x0098},
    {0xa0, 0x00, 0x009a},
    {0xa0, 0x00, 0x011a},
    {0xa0, 0x00, 0x011c},
    {0xa0, 0x05, 0x0012},
    {0xa0, 0x01, 0x0092},
    {0xa0, 0x06, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x02, 0x0092},
    {0xa0, 0x11, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x03, 0x0092},
    {0xa0, 0xe7, 0x0093},
    {0xa0, 0x01, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x04, 0x0092},
    {0xa0, 0x87, 0x0093},
    {0xa0, 0x02, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x06, 0x0092},
    {0xa0, 0x03, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x07, 0x0092},
    {0xa0, 0x02, 0x0093},
    {0xa0, 0x30, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x20, 0x0092},
    {0xa0, 0x00, 0x0093},
    {0xa0, 0x11, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x2f, 0x0092},
    {0xa0, 0xb0, 0x0093},
    {0xa0, 0xf7, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x30, 0x0092},
    {0xa0, 0x05, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x31, 0x0092},
    {0xa0, 0x00, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x34, 0x0092},
    {0xa0, 0x00, 0x0093},
    {0xa0, 0x01, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x35, 0x0092},
    {0xa0, 0x60, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x3d, 0x0092},
    {0xa0, 0x8f, 0x0093},
    {0xa0, 0x06, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x40, 0x0092},
    {0xa0, 0xe0, 0x0093},
    {0xa0, 0x01, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x58, 0x0092},
    {0xa0, 0x78, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x62, 0x0092},
    {0xa0, 0x11, 0x0093},
    {0xa0, 0x04, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x10, 0x0087},
    {0xa0, 0x37, 0x0101},
    {0xa0, 0x05, 0x0012},
    {0xa0, 0x0d, 0x0100},
    {0xa0, 0x06, 0x0189},
    {0xa0, 0x00, 0x01ad},
    {0xa0, 0x03, 0x01c5},
    {0xa0, 0x13, 0x01cb},
    {0xa0, 0x08, 0x0250},
    {0xa0, 0x08, 0x0301},
    {0xa0, 0x60, 0x01a8},
    {0xa0, 0x6c, 0x018d},
    {0xa1, 0x01, 0x0002},
    {0xa0, 0x09, 0x01ad},
    {0xa0, 0x15, 0x01ae},
    {0xa0, 0x00, 0x0092},
    {0xa0, 0x02, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa1, 0x01, 0x0095},
    {0xa1, 0x01, 0x0096},
    {0xa0, 0x50, 0x010a},
    {0xa0, 0xf8, 0x010b},
    {0xa0, 0xf8, 0x010c},
    {0xa0, 0xf8, 0x010d},
    {0xa0, 0x50, 0x010e},
    {0xa0, 0xf8, 0x010f},
    {0xa0, 0xf8, 0x0110},
    {0xa0, 0xf8, 0x0111},
    {0xa0, 0x50, 0x0112},
    {0xa1, 0x01, 0x0008},
    {0xa0, 0x03, 0x0008},	//00
    {0xa0, 0x08, 0x01c6},
    {0xa1, 0x01, 0x01c8},
    {0xa1, 0x01, 0x01c9},
    {0xa1, 0x01, 0x01ca},
    {0xa0, 0x0f, 0x01cb},

    {0xa0, 0x50, 0x010a},
    {0xa0, 0xf8, 0x010b},
    {0xa0, 0xf8, 0x010c},
    {0xa0, 0xf8, 0x010d},
    {0xa0, 0x50, 0x010e},
    {0xa0, 0xf8, 0x010f},
    {0xa0, 0xf8, 0x0110},
    {0xa0, 0xf8, 0x0111},
    {0xa0, 0x50, 0x0112},
    {0xa1, 0x01, 0x0180},
    {0xa0, 0x00, 0x0180},
    {0xa0, 0x00, 0x0019},
    {0xa0, 0x05, 0x0092},
    {0xa0, 0x66, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x09, 0x0092},
    {0xa0, 0xb2, 0x0093},
    {0xa0, 0x02, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x10, 0x0092},
    {0xa0, 0x02, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},

    {0xa0, 0x60, 0x011d},
    {0xa0, 0x00, 0x0190},
    {0xa0, 0x07, 0x0191},
    {0xa0, 0x8c, 0x0192},
    {0xa0, 0x00, 0x0195},
    {0xa0, 0x00, 0x0196},
    {0xa0, 0x8a, 0x0197},
    {0xa0, 0x10, 0x018c},
    {0xa0, 0x20, 0x018f},
    {0xa0, 0x14, 0x01a9},
    {0xa0, 0x24, 0x01aa},
    {0xa0, 0xd7, 0x001d},
    {0xa0, 0xf0, 0x001e},
    {0xa0, 0xf8, 0x001f},
    {0xa0, 0xff, 0x0020},
    {0xa0, 0x09, 0x01ad},
    {0xa0, 0x15, 0x01ae},
    {0xa0, 0x40, 0x0180},
    {0xa1, 0x01, 0x0180},
    {0xa0, 0x42, 0x0180},
    {0xa1, 0x01, 0x0008},
    {0xa1, 0x01, 0x0007},
// { 0xa0, 0x30, 0x0007},
// { 0xa0, 0x00, 0x0007},
    {0, 0, 0}
};

static __u16 pb0330xx_scale_data[][3] = {
    {0xa1, 0x01, 0x0008},
    {0xa1, 0x01, 0x0008},
    {0xa0, 0x01, 0x0000},
    {0xa0, 0x03, 0x0008},	//00
    {0xa0, 0x0a, 0x0010},
    {0xa0, 0x00, 0x0002},	// 10
    {0xa0, 0x02, 0x0003},
    {0xa0, 0x80, 0x0004},
    {0xa0, 0x01, 0x0005},
    {0xa0, 0xe0, 0x0006},
    {0xa0, 0x01, 0x0001},
    {0xa0, 0x05, 0x0012},
    {0xa0, 0x07, 0x0012},
    {0xa0, 0x00, 0x0098},
    {0xa0, 0x00, 0x009a},
    {0xa0, 0x00, 0x011a},
    {0xa0, 0x00, 0x011c},
    {0xa0, 0x05, 0x0012},
    {0xa0, 0x01, 0x0092},
    {0xa0, 0x06, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x02, 0x0092},
    {0xa0, 0x11, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x03, 0x0092},
    {0xa0, 0xe7, 0x0093},
    {0xa0, 0x01, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x04, 0x0092},
    {0xa0, 0x87, 0x0093},
    {0xa0, 0x02, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x06, 0x0092},
    {0xa0, 0x03, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x07, 0x0092},
    {0xa0, 0x02, 0x0093},
    {0xa0, 0x30, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x20, 0x0092},
    {0xa0, 0x00, 0x0093},
    {0xa0, 0x11, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x2f, 0x0092},
    {0xa0, 0xb0, 0x0093},
    {0xa0, 0xf7, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x30, 0x0092},
    {0xa0, 0x05, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x31, 0x0092},
    {0xa0, 0x00, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x34, 0x0092},
    {0xa0, 0x00, 0x0093},
    {0xa0, 0x01, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x35, 0x0092},
    {0xa0, 0x60, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x3d, 0x0092},
    {0xa0, 0x8f, 0x0093},
    {0xa0, 0x06, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x40, 0x0092},
    {0xa0, 0xe0, 0x0093},
    {0xa0, 0x01, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x58, 0x0092},
    {0xa0, 0x78, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x62, 0x0092},
    {0xa0, 0x11, 0x0093},
    {0xa0, 0x04, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x10, 0x0087},
    {0xa0, 0x37, 0x0101},
    {0xa0, 0x05, 0x0012},
    {0xa0, 0x0d, 0x0100},
    {0xa0, 0x06, 0x0189},
    {0xa0, 0x00, 0x01ad},
    {0xa0, 0x03, 0x01c5},
    {0xa0, 0x13, 0x01cb},
    {0xa0, 0x08, 0x0250},
    {0xa0, 0x08, 0x0301},
    {0xa0, 0x60, 0x01a8},
    {0xa0, 0x6c, 0x018d},
    {0xa1, 0x01, 0x0002},
    {0xa0, 0x09, 0x01ad},
    {0xa0, 0x15, 0x01ae},
    {0xa0, 0x00, 0x0092},
    {0xa0, 0x02, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa1, 0x01, 0x0095},
    {0xa1, 0x01, 0x0096},
    {0xa0, 0x50, 0x010a},
    {0xa0, 0xf8, 0x010b},
    {0xa0, 0xf8, 0x010c},
    {0xa0, 0xf8, 0x010d},
    {0xa0, 0x50, 0x010e},
    {0xa0, 0xf8, 0x010f},
    {0xa0, 0xf8, 0x0110},
    {0xa0, 0xf8, 0x0111},
    {0xa0, 0x50, 0x0112},
    {0xa1, 0x01, 0x0008},
    {0xa0, 0x03, 0x0008},	//00
    {0xa0, 0x08, 0x01c6},
    {0xa1, 0x01, 0x01c8},
    {0xa1, 0x01, 0x01c9},
    {0xa1, 0x01, 0x01ca},
    {0xa0, 0x0f, 0x01cb},

    {0xa0, 0x50, 0x010a},
    {0xa0, 0xf8, 0x010b},
    {0xa0, 0xf8, 0x010c},
    {0xa0, 0xf8, 0x010d},
    {0xa0, 0x50, 0x010e},
    {0xa0, 0xf8, 0x010f},
    {0xa0, 0xf8, 0x0110},
    {0xa0, 0xf8, 0x0111},
    {0xa0, 0x50, 0x0112},
    {0xa1, 0x01, 0x0180},
    {0xa0, 0x00, 0x0180},
    {0xa0, 0x00, 0x0019},
    {0xa0, 0x05, 0x0092},
    {0xa0, 0x66, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x09, 0x0092},
    {0xa0, 0xb2, 0x0093},
    {0xa0, 0x02, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x10, 0x0092},
    {0xa0, 0x02, 0x0093},
    {0xa0, 0x00, 0x0094},
    {0xa0, 0x01, 0x0090},
    {0xa1, 0x01, 0x0091},
    {0xa0, 0x60, 0x011d},
    {0xa0, 0x00, 0x0190},
    {0xa0, 0x07, 0x0191},
    {0xa0, 0x8c, 0x0192},
    {0xa0, 0x00, 0x0195},
    {0xa0, 0x00, 0x0196},
    {0xa0, 0x8a, 0x0197},
    {0xa0, 0x10, 0x018c},
    {0xa0, 0x20, 0x018f},
    {0xa0, 0x14, 0x01a9},
    {0xa0, 0x24, 0x01aa},
    {0xa0, 0xd7, 0x001d},
    {0xa0, 0xf0, 0x001e},
    {0xa0, 0xf8, 0x001f},
    {0xa0, 0xff, 0x0020},
    {0xa0, 0x09, 0x01ad},
    {0xa0, 0x15, 0x01ae},
    {0xa0, 0x40, 0x0180},
    {0xa1, 0x01, 0x0180},
    {0xa0, 0x42, 0x0180},
    {0xa1, 0x01, 0x0008},
    {0xa1, 0x01, 0x0007},
// { 0xa0, 0x30, 0x0007},
// { 0xa0, 0x00, 0x0007},
    {0, 0, 0}
};
static __u16 pb0330_50HZ[][3] = {
    {0xa0, 0x0000, 0x0190}, //01,90,00,cc
    {0xa0, 0x0007, 0x0191}, //01,91,07,cc
    {0xa0, 0x00ee, 0x0192}, //01,92,ee,cc
    {0xa0, 0x0000, 0x0195}, //01,95,00,cc
    {0xa0, 0x0000, 0x0196}, //01,96,00,cc
    {0xa0, 0x0046, 0x0197}, //01,97,46,cc
    {0xa0, 0x0010, 0x018c}, //01,8c,10,cc
    {0xa0, 0x0020, 0x018f}, //01,8f,20,cc
    {0xa0, 0x000c, 0x01a9}, //01,a9,0c,cc
    {0xa0, 0x0026, 0x01aa}, //01,aa,26,cc
    {0xa0, 0x0068, 0x001d}, //00,1d,68,cc
    {0xa0, 0x0090, 0x001e}, //00,1e,90,cc
    {0xa0, 0x00c8, 0x001f}, //00,1f,c8,cc
/*******************/
{0, 0, 0}
};
static __u16 pb0330_50HZScale[][3] = {
    {0xa0, 0x0000, 0x0019}, //00,19,00,cc
    {0xa0, 0x0000, 0x0190}, //01,90,00,cc
    {0xa0, 0x0007, 0x0191}, //01,91,07,cc
    {0xa0, 0x00a0, 0x0192}, //01,92,a0,cc
    {0xa0, 0x0000, 0x0195}, //01,95,00,cc
    {0xa0, 0x0000, 0x0196}, //01,96,00,cc
    {0xa0, 0x007a, 0x0197}, //01,97,7a,cc
    {0xa0, 0x0010, 0x018c}, //01,8c,10,cc
    {0xa0, 0x0020, 0x018f}, //01,8f,20,cc
    {0xa0, 0x000c, 0x01a9}, //01,a9,0c,cc
    {0xa0, 0x0026, 0x01aa}, //01,aa,26,cc
    {0xa0, 0x00e5, 0x001d}, //00,1d,e5,cc
    {0xa0, 0x00f0, 0x001e}, //00,1e,f0,cc
    {0xa0, 0x00f8, 0x001f}, //00,1f,f8,cc
/*******************/
{0, 0, 0}
};
static __u16 pb0330_60HZ[][3] = {
    {0xa0, 0x0000, 0x0019}, //00,19,00,cc
    {0xa0, 0x0000, 0x0190}, //01,90,00,cc
    {0xa0, 0x0007, 0x0191}, //01,91,07,cc
    {0xa0, 0x00dd, 0x0192}, //01,92,dd,cc
    {0xa0, 0x0000, 0x0195}, //01,95,00,cc
    {0xa0, 0x0000, 0x0196}, //01,96,00,cc
    {0xa0, 0x003d, 0x0197}, //01,97,3d,cc
    {0xa0, 0x0010, 0x018c}, //01,8c,10,cc
    {0xa0, 0x0020, 0x018f}, //01,8f,20,cc
    {0xa0, 0x000c, 0x01a9}, //01,a9,0c,cc
    {0xa0, 0x0026, 0x01aa}, //01,aa,26,cc
    {0xa0, 0x0043, 0x001d}, //00,1d,43,cc
    {0xa0, 0x0050, 0x001e}, //00,1e,50,cc
    {0xa0, 0x0090, 0x001f}, //00,1f,90,cc
/*******************/
{0, 0, 0}
};
static __u16 pb0330_60HZScale[][3] = {
    {0xa0, 0x0000, 0x0019}, //00,19,00,cc
    {0xa0, 0x0000, 0x0190}, //01,90,00,cc
    {0xa0, 0x0007, 0x0191}, //01,91,07,cc
    {0xa0, 0x00a0, 0x0192}, //01,92,a0,cc
    {0xa0, 0x0000, 0x0195}, //01,95,00,cc
    {0xa0, 0x0000, 0x0196}, //01,96,00,cc
    {0xa0, 0x007a, 0x0197}, //01,97,7a,cc
    {0xa0, 0x0010, 0x018c}, //01,8c,10,cc
    {0xa0, 0x0020, 0x018f}, //01,8f,20,cc
    {0xa0, 0x000c, 0x01a9}, //01,a9,0c,cc
    {0xa0, 0x0026, 0x01aa}, //01,aa,26,cc
    {0xa0, 0x0041, 0x001d}, //00,1d,41,cc
    {0xa0, 0x0050, 0x001e}, //00,1e,50,cc
    {0xa0, 0x0090, 0x001f}, //00,1f,90,cc
/*******************/
{0, 0, 0}
};
static __u16 pb0330_NoFliker[][3] = {
    {0xa0, 0x0000, 0x0019}, //00,19,00,cc
    {0xa0, 0x0000, 0x0190}, //01,90,00,cc
    {0xa0, 0x0007, 0x0191}, //01,91,07,cc
    {0xa0, 0x00f0, 0x0192}, //01,92,f0,cc
    {0xa0, 0x0000, 0x0195}, //01,95,00,cc
    {0xa0, 0x0000, 0x0196}, //01,96,00,cc
    {0xa0, 0x0010, 0x0197}, //01,97,10,cc
    {0xa0, 0x0010, 0x018c}, //01,8c,10,cc
    {0xa0, 0x0020, 0x018f}, //01,8f,20,cc
    {0xa0, 0x0000, 0x01a9}, //01,a9,00,cc
    {0xa0, 0x0000, 0x01aa}, //01,aa,00,cc
    {0xa0, 0x0009, 0x001d}, //00,1d,09,cc
    {0xa0, 0x0040, 0x001e}, //00,1e,40,cc
    {0xa0, 0x0090, 0x001f}, //00,1f,90,cc
/*******************/
{0, 0, 0}
};
static __u16 pb0330_NoFlikerScale[][3] = {
    {0xa0, 0x0000, 0x0019}, //00,19,00,cc
    {0xa0, 0x0000, 0x0190}, //01,90,00,cc
    {0xa0, 0x0007, 0x0191}, //01,91,07,cc
    {0xa0, 0x00f0, 0x0192}, //01,92,f0,cc
    {0xa0, 0x0000, 0x0195}, //01,95,00,cc
    {0xa0, 0x0000, 0x0196}, //01,96,00,cc
    {0xa0, 0x0010, 0x0197}, //01,97,10,cc
    {0xa0, 0x0010, 0x018c}, //01,8c,10,cc
    {0xa0, 0x0020, 0x018f}, //01,8f,20,cc
    {0xa0, 0x0000, 0x01a9}, //01,a9,00,cc
    {0xa0, 0x0000, 0x01aa}, //01,aa,00,cc
    {0xa0, 0x0009, 0x001d}, //00,1d,09,cc
    {0xa0, 0x0040, 0x001e}, //00,1e,40,cc
    {0xa0, 0x0090, 0x001f}, //00,1f,90,cc
/*******************/
{0, 0, 0}
};