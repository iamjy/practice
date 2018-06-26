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
	   int      screen_width;                    // 화면의 픽셀 폭
	      int      screen_height;                   // 화면의 픽셀 높이
	         int      bits_per_pixel;                  // 픽셀당 비트 개수
		    int      line_length;                     // 라인당 바이트 개수

		       int      fb_fd;                           // 프레임 버퍼 디스크립터
		          struct   fb_var_screeninfo  fbvar;        // 프레임 버퍼 변경 가능 정보
			     struct   fb_fix_screeninfo  fbfix;        // 프레임 버퍼 고정 정보
			        void     *fb_mapped;                      // 프레임 버퍼를 메모리 매핑한 포인터
				   int      mem_size;                        // 프레임 버퍼의 전체 메모리 용량
				      unsigned char *ptr;                      // 프레임 버퍼 중 점을 찍을 위치 포인터

				         unsigned color;                          // 점의 색상

					    int      cell_x;                          // 16x16 바둑판에서 한개의 셀에 대한 x 픽셀 위치
					       int      cell_y;                          // 16x16 바둑판에서 한개의 셀에 대한 y 픽셀 위치
					          int      coor_x;                          // 16x16 바둑판을 그리기 위한 loop 변수
						     int      coor_y;                          // 16x16 바둑판을 그리기 위한 loop 변수



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

							      ioctl( fb_fd, FBIOGET_VSCREENINFO, &fbvar);
							         ioctl( fb_fd, FBIOGET_FSCREENINFO, &fbfix);

								    screen_width   = fbvar.xres;                    // 스크린의 픽셀 폭
								       screen_height  = fbvar.yres;                    // 스크린의 픽셀 높이
								          bits_per_pixel = fbvar.bits_per_pixel;          // 픽셀 당 비트 개수
									     line_length    = fbfix.line_length;             // 한개 라인 당 바이트 개수

									        mem_size       = line_length * screen_height;

										   fb_mapped      = ( void *)mmap( 0,               // 프레임 버퍼에 대한 매핑
												                                      mem_size,
																                                         PROT_READ|PROT_WRITE,
																					                                    MAP_SHARED,
																									                                       fb_fd,
																													                                          0);

										      color   = 0;
										         for ( cell_y = 0; cell_y < 256; cell_y += 16)         // 16x16 바둑판의 y 좌표
												    {
													          for ( cell_x = 0; cell_x < 256; cell_x += 16)      // 16x16 바툭판의 x 좌료
															        {
																	         for ( coor_y = cell_y; coor_y < cell_y+16; coor_y++)           // y 좌표
																			          {
																					              for ( coor_x = cell_x; coor_x < cell_x+16; coor_x++)        // x 좌료
																							                  {
																										                 ptr  = ( unsigned char*)fb_mapped + screen_width * coor_y + +coor_x;
																												               *ptr  = color;
																													                   }
																						               }
																		          color++;                   // color 인덱스를 증가
																			        }
														     }

											    munmap( fb_mapped, mem_size);
											       close( fb_fd);

											          return 0;
}
