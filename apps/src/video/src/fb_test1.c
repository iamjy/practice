#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <unistd.h>        // open/close
#include <fcntl.h>         // O_RDWR
#include <sys/ioctl.h>     // ioctl
#include <sys/mman.h>      // mmap PROT_
#include <linux/fb.h>

int   main( int argc, char **argv)
{
	   int      screen_width;
	      int      screen_height;
	         int      bits_per_pixel;
		    int      line_length;

		       int      fb_fd;
		          struct   fb_var_screeninfo  fbvar;      
			     struct   fb_fix_screeninfo  fbfix;
			                         
			        int      ndx;
				   unsigned short color;                    

				      if ( access( "/dev/fb0", F_OK))
					         {
							       printf( "프레임 버퍼 장치가 없습니다.n");
							             return 0;
								        }

				         if ( 0 > ( fb_fd = open( "/dev/fb0", O_RDWR)))
						    {
							          printf( "프레임 버퍼에 접근할 수 없습니다.n");
								        return 0;

									   }

					    if ( ioctl( fb_fd, FBIOGET_VSCREENINFO, &fbvar))
						       {
							             printf( "FBIOGET_VSCREENINFO를 실행하지 못했습니다.n");
								           return 0;
									      }
					       if ( ioctl( fb_fd, FBIOGET_FSCREENINFO, &fbfix))
						          {
								        printf( "FBIOGET_FSCREENINFO 실행하지 못했습니다.n");
									      return 0;
									         }

					          screen_width   = fbvar.xres;                    // 스크린의 픽셀 폭
						     screen_height  = fbvar.yres;                    // 스크린의 픽셀 높이
						        bits_per_pixel = fbvar.bits_per_pixel;          // 픽셀 당 비트 개수
							   line_length    = fbfix.line_length;             // 한개 라인 당 바이트 개수

							      printf( "screen width   = %dn", screen_width  );
							         printf( "screen height  = %dn", screen_height );
								    printf( "bits per pixel = %dn", bits_per_pixel);
								       printf( "line length    = %dn", line_length   );

								          color   = 0xffff;
									     for ( ndx = 0; ndx < 100; ndx++)
										        {
												      lseek( fb_fd, 0, SEEK_SET);
												            lseek( fb_fd, ndx * line_length +ndx *(bits_per_pixel / 8), SEEK_SET);
													          write( fb_fd, &color, 2);
														     }

									        for ( ndx = 0; ndx < screen_width-100; ndx++)
											   {
												         write( fb_fd, &color, 2);
													    }
										   close( fb_fd);

										      return 0;
}
