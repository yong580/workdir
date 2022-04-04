#此makefile用于运行单个文件的小demo，将src中的每个源文件均生成一个可执行文件
#在工作目录下，执行clean可以将生成的文件删除
src=$(wildcard ./src/*.c)
target=$(patsubst ./src/%.c,./%, $(src))
obj=$(patsubst ./src/%.c,./obj/%.o, $(src))
exe_name=$(patsubst ./src/%.c,%, $(src))
ALL:$(target)
args= -Wall -g
inc_path=./inc
$(target):./%:./obj/%.o
	gcc $< -o $@
$(obj):./obj/%.o:./src/%.c
	gcc -c $< -o  $@ $(args) -I $(inc_path)

clean:
	-rm -rf $(obj) $(exe_name)

.PHONY:clean ALL

