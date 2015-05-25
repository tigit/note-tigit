SRCS= adb.c console.c transport.c transport_local.c transport_usb.c commandline.c adb_client.c adb_auth_host.c sockets.c services.c file_sync_client.c get_my_path_linux.c usb_linux.c utils.c usb_vendors.c fdevent.c

VPATH+= ../libcutils
SRCS+= abort_socket.c
SRCS+= socket_inaddr_any_server.c
SRCS+= socket_local_client.c
SRCS+= socket_local_server.c
SRCS+= socket_loopback_client.c
SRCS+= socket_loopback_server.c
SRCS+= socket_network_client.c
SRCS+= load_file.c
SRCS+= list.c


VPATH+= ../libzipfile
SRCS+= centraldir.c
SRCS+= zipfile.c

VPATH+= ../../../external/zlib/src
SRCS+= adler32.c
SRCS+= compress.c
SRCS+= crc32.c
SRCS+= deflate.c
SRCS+= infback.c
SRCS+= inffast.c
SRCS+= inflate.c
SRCS+= inftrees.c
SRCS+= trees.c
SRCS+= uncompr.c
SRCS+= zutil.c

LIBS = -lpthread -lcrypto -lrt -ldl

CPPFLAGS+= -DADB_HOST=1
CPPFLAGS+= -DADB_HOST_ON_TARGET=1
CPPFLAGS+= -DHAVE_FORKEXEC=1
CPPFLAGS+= -DHAVE_SYMLINKS
CPPFLAGS+= -DHAVE_TERMIO_H
CPPFLAGS+= -D_GNU_SOURCE
CPPFLAGS+= -D_XOPEN_SOURCE
CPPFLAGS+= -I.
CPPFLAGS+= -I../include
CPPFLAGS+= -I../../../external/openssl/include
CPPFLAGS+= -I../../../external/zlib

CFLAGS= -O2 -g -Wall -Wno-unused-parameter -D_XOPEN_SOURCE -D_GNU_SOURCE

LDFLAGS= -static -L/lib/arm-linux-gnueabihf -L/usr/lib/arm-linux-gnueabihf 

#TOOLCHAIN= /media/tigit/DATA/WORKING_DIRECTORY/prebuilts/gcc/linux-x86/arm/arm-none-linux-gnueabi-4.7/bin/arm-none-linux-gnueabi-
#CC= $(TOOLCHAIN)gcc
#LD= $(TOOLCHAIN)gcc
CC= arm-linux-gnueabihf-gcc-4.7
LD= arm-linux-gnueabihf-gcc-4.7
 
OBJS= $(SRCS:.c=.o)
 
all: adb
 
adb: $(OBJS)
	$(LD) -o $@ $(LDFLAGS) $(OBJS) $(LIBS)
 
clean:
	rm -rf $(OBJS)
