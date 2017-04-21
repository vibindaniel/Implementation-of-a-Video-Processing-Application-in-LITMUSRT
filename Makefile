# ##############################################################################
# User variables

# user variables can be specified in the environment or in the local make.conf file
-include make.conf

# Where is the LITMUS^RT userspace library source tree?
# By default, we assume that it resides in a sibling directory named 'liblitmus'.
LIBLITMUS ?= ../liblitmus

# Include default configuration from liblitmus.
# IMPORTANT: Liblitmus must have been built before this file exists.
include ${LIBLITMUS}/inc/config.makefile

# all sources
vpath %.c src/

# local include files
CPPFLAGS += -Iinclude/ -I/usr/include/SDL -I/root/ffmpeg_build/include/

LDLIBS += $(shell pkg-config --libs libavformat libavcodec libswscale libavutil sdl) -lm

# ##############################################################################
# Targets

all = base_mt_task

.PHONY: all clean
all: ${all}
clean:
	rm -f ${all} *.o *.d

obj-base_task = base_mt_task.o
base_mt_task: ${obj-base_mt_task}


# dependency discovery
include ${LIBLITMUS}/inc/depend.makefile
