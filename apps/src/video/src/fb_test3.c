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
	int screen_width;
	      int      screen_height;
	         int      bits_per_pixel;
		    int      line_length;

		       int      fb_fd;
		          struct   fb_var_screeninfo  fbvar;
			     struct   fb_fix_screeninfo  fbfix;
			        void     *fb_mapped;
				   int      mem_size;
				      unsigned short *ptr;

				         int      coor_y;
					    int      coor_x;

					       int      color_r;
					          int      color_g;
						     int      color_b;

						        int      color;

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

										   mem_size       = line_length * screen_height;

										      fb_mapped      = ( void *)mmap( 0,
												                                         mem_size,
																	                                    PROT_READ|PROT_WRITE,
																					                                       MAP_SHARED,
																									                                          fb_fd,
																														                                     0);


										         color_r   = 0x1f;
											    color_g   = 0x00;
											       color_b   = 0x00;
											          
											          color   =   (color_r << fbvar.red.offset  ) 
													             | (color_g << fbvar.green.offset) 
														                | (color_b << fbvar.blue.offset );
												     
												     
												     for ( coor_y = 0; coor_y < 20; coor_y++)
													        {
															      ptr   = ( unsigned short*)fb_mapped + screen_width * coor_y;
															            for ( coor_x = 0; coor_x < 200; coor_x++)
																	          {
																			          *ptr++  = color;
																				        }
																       }

												        color_r   = 0x00;
													   color_g   = 0x3f;
													      color_b   = 0x00;
													         
													         color   =   (color_r << fbvar.red.offset  ) 
															            | (color_g << fbvar.green.offset) 
																               | (color_b << fbvar.blue.offset );
														    
														    
														    for ( coor_y = 20; coor_y < 40; coor_y++)
															       {
																             ptr   = ( unsigned short*)fb_mapped + screen_width * coor_y;
																	           for ( coor_x = 0; coor_x < 200; coor_x++)
																			         {
																					         *ptr++  = color;
																						       }
																		      }

														       color_r   = 0x00;
														          color_g   = 0x00;
															     color_b   = 0x1f;
															        
															        color   =   (color_r << fbvar.red.offset  ) 
																	           | (color_g << fbvar.green.offset) 
																		              | (color_b << fbvar.blue.offset );
																   
																   
																   for ( coor_y = 40; coor_y < 60; coor_y++)
																	      {
																		            ptr   = ( unsigned short*)fb_mapped + screen_width * coor_y;
																			          for ( coor_x = 0; coor_x < 200; coor_x++)
																					        {
																							        *ptr++  = color;
																								      }
																				     }


																      munmap( fb_mapped, mem_size);
																         close( fb_fd);

																	    return 0;
}
