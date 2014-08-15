CC=clang

FRAMEWORKS:= -framework Foundation
LIBRARIES:= -lobjc

SOURCE=src/notice.m

CFLAGS=-dynamiclib -fobjc-arc -Wall -Werror -v $(SOURCE)
LDFLAGS=$(LIBRARIES) $(FRAMEWORKS)
OUT=-o ../resources/libnotice.dylib

all:
	$(CC) $(CFLAGS) $(LDFLAGS) $(OUT)

