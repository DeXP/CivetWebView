CC=gcc
CPP=g++
REMOVE=rm
WEBKITFLAGS=`pkg-config --cflags --libs gtk+-3.0 webkit2gtk-4.0`
COMMONFLAGS=-Iwebview -I./civetweb/src/third_party -I./civetweb/include -I./civetweb/src/third_party -I./civetweb/src/third_party/lua-5.2.4/src -I./civetweb/src/third_party/duktape-1.5.2/src -DNO_SSL -DLUA_COMPAT_ALL -DUSE_LUA -DUSE_LUA_SQLITE3 -DUSE_LUA_FILE_SYSTEM -DUSE_LUA_LUAXML -DUSE_DUKTAPE -DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_FTS3_PARENTHESIS -DWEBVIEW_GTK
CPPFLAGS=-c -std=c++17 $(COMMONFLAGS) $(WEBKITFLAGS)
CFLAGS=-c $(COMMONFLAGS) $(WEBKITFLAGS) -Wformat-truncation=1 
LDFLAGS=-s $(WEBKITFLAGS) -ldl
LUAMAINS=civetweb/src/third_party/lua-5.2.4/src/lua.c civetweb/src/third_party/lua-5.2.4/src/luac.c
CSOURCES=civetweb/src/civetweb.c $(wildcard civetweb/src/third_party/*.c) civetweb/src/third_party/duktape-1.5.2/src/duktape.c $(filter-out $(LUAMAINS), $(wildcard civetweb/src/third_party/lua-5.2.4/src/*.c))
CPPSOURCES=CivetWebView.cpp civetweb/src/CivetServer.cpp
COBJECTS=$(CSOURCES:.c=.o)
CPPOBJECTS=$(CPPSOURCES:.cpp=.o)
EXECUTABLE=CivetWebView

all: $(CSOURCES) $(CPPSOURCES) $(EXECUTABLE)
	
$(EXECUTABLE): $(COBJECTS) $(CPPOBJECTS)
	$(CPP) $(CPPOBJECTS) $(COBJECTS) $(LDFLAGS) -o $@
	$(REMOVE) $(COBJECTS) $(CPPOBJECTS)

.c.o:
	$(CC) $(CFLAGS) $< -o $@

.cpp.o:
	$(CPP) $(CPPFLAGS) $< -o $@

clean:
	$(REMOVE) $(COBJECTS)
	$(REMOVE) $(CPPOBJECTS)
	$(REMOVE) $(EXECUTABLE)
