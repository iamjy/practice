#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <linux/fb.h>
#include <sys/mman.h>
 
int main()
{
    	int fbfd = 0;
    	struct fb_var_screeninfo vinfo;
    	struct fb_fix_screeninfo finfo;
    	long int screensize = 0;
    	char *fbp = 0;
    	int x = 0, y = 0, i=0;
    	long int location = 0;
	 
    	// Open the file for reading and writing
    	fbfd = open("/dev/fb0", O_RDWR);
    	if (!fbfd) {
        	printf("Error: cannot open framebuffer device.\n");
        	exit(1);
    	}
    	printf("The framebuffer device was opened successfully.\n");
	 
    	// Get fixed screen information
    	if (ioctl(fbfd, FBIOGET_FSCREENINFO, &finfo)) {
        	printf("Error reading fixed information.\n");
        	exit(2);
    	}
	 
    	// Get variable screen information
    	if (ioctl(fbfd, FBIOGET_VSCREENINFO, &vinfo)) {
        	printf("Error reading variable information.\n");
        	exit(3);
    	}
	 
    	printf("Screen Info : %dx%d, %dbpp\n", vinfo.xres, vinfo.yres, vinfo.bits_per_pixel );
	 
    	// Figure out the size of the screen in bytes
    	screensize = vinfo.xres * vinfo.yres * vinfo.bits_per_pixel / 8;
	 
    	// Map the device to memory
    	fbp = (char *)mmap(0, screensize, PROT_READ | PROT_WRITE, MAP_SHARED, fbfd, 0);
    	if ((int)fbp == -1) {
        	printf("Error: failed to map framebuffer device to memory.\n");
        	exit(4);
    	}
    	printf("The framebuffer device was mapped to memory successfully.\n");

	/* clear the screen */
       	for ( y = 0; y < vinfo.yres; y++ )
       		for ( x = 0; x < vinfo.xres; x++ ) {
            		location = (x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) +
                       		(y+vinfo.yoffset) * finfo.line_length;
			//white
			*(fbp + location) = 0xff;
			*(fbp + location+1) = 0xff;
			*(fbp + location+2) = 0xff;
			*(fbp + location+3) = 0;
	}
	 
    	// Put the pixel
	for ( y = 100; y < 200; y++ ) {
		for ( x = 0; x < 1024; x++ ) {
			location = (x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) +
				(y+vinfo.yoffset) * finfo.line_length;
		 
				*(fbp + location) = 0xff;	// Blue
				*(fbp + location + 1) = 0;	// Green
				*(fbp + location + 2) = 0;	// Red
				*(fbp + location + 3) = 0;     	// Transparency
        	}
	}

	for ( y = 200; y < 300; y++ ) {
		for ( x = 0; x < 1024; x++ ) {
			location = (x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) +
				(y+vinfo.yoffset) * finfo.line_length;
		 
				*(fbp + location) = 0;		// Blue
				*(fbp + location + 1) = 0xff;	// Green
				*(fbp + location + 2) = 0;	// Red
				*(fbp + location + 3) = 0;     	// Transparency
        	}
	}

	for ( y = 300; y < 400; y++ ) {
		for ( x = 0; x < 1024; x++ ) {
			location = (x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) +
				(y+vinfo.yoffset) * finfo.line_length;
		 
				*(fbp + location) = 0;		// Blue
				*(fbp + location + 1) = 0;	// Green
				*(fbp + location + 2) = 0xff;	// Red
				*(fbp + location + 3) = 0;     	// Transparency
        	}
	}

	for ( y = 400; y < 500; y++ ) {
		for ( x = 0; x < 1024; x++ ) {
			location = (x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) +
				(y+vinfo.yoffset) * finfo.line_length;
		 
				*(fbp + location) = 100;	// Blue
				*(fbp + location + 1) = 100;	// Green
				*(fbp + location + 2) = 100;	// Red
				*(fbp + location + 3) = 0;     	// Transparency
        	}
	}

    	munmap(fbp, screensize);
     	close(fbfd);
    	return 0;
} 

