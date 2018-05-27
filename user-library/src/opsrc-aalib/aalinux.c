#include "config.h"
#ifdef LINUX_DRIVER
#include <sys/stat.h>
#include <malloc.h>
#include <sys/ioctl.h>
#include <linux/kd.h>
#ifdef GPM_MOUSEDRIVER
#include <gpm.h>
#endif
#include <unistd.h>
#include <fcntl.h>
#include <setjmp.h>
#include <signal.h>
#include <stdio.h>
#include "aalib.h"
struct aa_driver linux_d;
static FILE *vc;
static int vt;

static void linux_cursor(aa_context * c, int mode)
{
    if (mode) {
	printf("[?25h");
    } else
	printf("[?25l");
    fflush(stdout);
}
static int linux_init(struct aa_hardware_params *p, void *none, struct aa_hardware_params *dest, void **params)
{
    static int registered = 0;
    static struct aa_font font;
    static struct aa_hardware_params def={NULL, AA_DIM_MASK | AA_REVERSE_MASK | AA_NORMAL_MASK | AA_BOLD_MASK | AA_EXTENDED};
    struct stat sbuf;
    int major, minor;
    char fname[20];
    int i, y;
    int fd;
    *dest=def;
    fflush(stdout);
    fd = dup(fileno(stderr));
    fstat(fd, &sbuf);
    major = sbuf.st_rdev >> 8;
    vt = minor = sbuf.st_rdev & 0xff;
    close(fd);
    if (major != 4 || minor >= 64)
	return (0);
    sprintf(fname, "/dev/vcsa%i", vt);
    vc = fopen(fname, "w+");
    if (vc == NULL)
	return 0;
    if (!registered) {
	fd = open("/dev/console", 0);
	if (fd >= 0) {
	    char buf[32 * 1024];
	    struct consolefontdesc desc;
	    desc.chardata = buf;
	    desc.charcount = 1024;
	    i = ioctl(fd, GIO_FONTX, &desc);
	    close(fd);
	    if (i) {		/*probably mda/hercules */
		dest->font = &aa_font14;
		dest->supported &= ~AA_DIM_MASK;
		goto skip;
	    }
	    font.name = "Font used by your console";
	    font.shortname = "current";
	    font.height = desc.charheight;
	    font.data = malloc(desc.charheight * 256);
	    if (font.data == NULL)
		goto skip;
	    y = 0;
	    for (i = 0; i < 8192; i++) {
		if (i % 32 < font.height) {
		    font.data[y] = desc.chardata[i], y++;
		}
	    }
	    aa_registerfont(&font);
	    dest->font = &font;
	}
    }
  skip:;
    aa_recommendlowkbd("slang");
    return 1;
}
static void linux_uninit(aa_context * c)
{
    linux_cursor(c, 1);
    fclose(vc);
}
static void linux_getsize(aa_context * c, int *width, int *height)
{
    struct {
	unsigned char lines, cols, x, y;
    } scrn = {
	0, 0, 0, 0
    };
    (void) fseek(vc, 0, SEEK_SET);
    (void) fread(&scrn, 4, 1, vc);

    *width = scrn.cols;
    *height = scrn.lines;
#ifdef GPM_MOUSEDRIVER
    gpm_mx = *width-1;
    gpm_my = *height-1;
#endif
}

static void linux_flush(aa_context * c)
{
    int x, end = aa_scrwidth(c) * aa_scrheight(c);
    unsigned char data[] =
    {0x07, 0x08, 0x0f, 0x0f, 0x70, 0x17};
    fseek(vc, 4, 0);
    for (x = 0; x < end; x++) {
	putc(c->textbuffer[x], vc);
	if (c->attrbuffer[x] < 7)
	    putc(data[c->attrbuffer[x]], vc);
	else
	    putc(0x27, vc);
    }
    fflush(vc);
}
static void linux_gotoxy(aa_context * c, int x, int y)
{
    struct {
	unsigned char lines, cols, x, y;
    } scrn = {
	aa_scrwidth(c), aa_scrwidth(c), x, y
    };
    (void) fseek(vc, 0, SEEK_SET);
    (void) fwrite(&scrn, 4, 1, vc);
    fflush(vc);
}
struct aa_driver linux_d =
{
    "linux", "Linux pc console driver 1.0",
    linux_init,
    linux_uninit,
    linux_getsize,
    NULL,
    NULL,
    linux_gotoxy,
    linux_flush,
    linux_cursor
};
#endif
