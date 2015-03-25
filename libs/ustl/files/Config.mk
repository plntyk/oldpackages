################ Build options #######################################

NAME		:= ustl
MAJOR		:= 2
MINOR		:= 2

#DEBUG		:= 1
BUILD_SHARED	:= 1
BUILD_STATIC	:= 1
NOLIBSTDCPP	:= 1

################ Programs ############################################

CXX		:= $(CROSS)g++
LD		:= $(CROSS)g++
AR		:= $(CROSS)ar
RANLIB		:= $(CROSS)ranlib
DOXYGEN		:= echo
INSTALL		:= install

INSTALLDATA	:= ${INSTALL} -D -p -m 644
INSTALLLIB	:= ${INSTALLDATA}

################ Destination #########################################

prefix		:= /usr
exec_prefix	:= /usr
BINDIR		:= /usr/bin
INCDIR		:= /usr/include
LIBDIR		:= /usr/lib

################ Compiler options ####################################

WARNOPTS	:= -Wall -Wextra -Woverloaded-virtual -Wpointer-arith\
		-Wshadow -Wredundant-decls -Wcast-qual
TGTOPTS		:= -std=c++11
INLINEOPTS	:= -finline-limit=65535

CXXFLAGS	:= ${WARNOPTS} ${TGTOPTS} -fPIC
LDFLAGS		:=
LIBS		:=
ifdef DEBUG
    CXXFLAGS	+= -O0 -g
    LDFLAGS	+= -rdynamic
else
    CXXFLAGS	+= -Os -g0 -DNDEBUG=1 -fomit-frame-pointer ${INLINEOPTS}
    LDFLAGS	+= -s -Wl,-gc-sections
endif
ifdef NOLIBSTDCPP
    LD		:= $(CROSS)gcc
    STAL_LIBS	:= -lsupc++ -lgcc_s -lc
    LIBS	:= ${STAL_LIBS}
endif
O		:= .o/

slib_lnk	= lib$1.so
slib_son	= lib$1.so.${MAJOR}
slib_tgt	= lib$1.so.${MAJOR}.${MINOR}
slib_flags	= -shared -Wl,-soname=$1
