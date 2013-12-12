.PHONY: all clean lib
	
all: test

test: json_st.cc json_st.hh test.cc json.tab.c lex.yy.c
	g++ -O3 -std=gnu++11 $^ -o $@	

lib: json_st.cc json_st.hh json.tab.c lex.yy.c
	g++ -O3 -std=gnu++11 -fpic -shared $^ -o libjsonxx.so

json.tab.c: json.y
	bison -d json.y
	
lex.yy.c: json.l
	flex json.l

clean:
	rm -rf json.tab.c json.tab.h lex.yy.c test
