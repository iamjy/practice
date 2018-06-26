CROSS=arm-none-linux-gnueabi-

CFLAGS:= -I/home/iamjy1005/work/lab/project/buildroot/buildroot-2017.11.2.git/output/target/usr/include
LDFLAGS:= -L/home/iamjy1005/work/lab/project/buildroot/buildroot-2017.11.2.git/output/target/usr/lib \
	  -L/home/iamjy1005/work/lab/project/soc/samsung/ap/exynos4412/board/dtk4412/src/DTK4412/Complete/Linux/Application/CAM8200-U.git/libuvc/build

TARGET=luvc_test

all: luvc_test

luvc_test:
	$(CROSS)gcc -o $(TARGET) luvc_test.c $(CFLAGS) $(LDFLAGS) -ljpeg -lusb-1.0 -luvc

install:
	cp $(TARGET) /export/DTK4412-NFS

clean:
	@rm -vf luvc_test *.o *~
