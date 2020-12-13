all: done

done: make_lib
	@echo "copilation done... cleaning working directory..."
	@echo "done end of compilation."

make_lib: make_obj
	@echo "building single static library"
	@ar rvs bignum.lib *.o

#g++ -std=c++14 -static-libgcc -static-libstdc++ -I ./include -c ./source/*.cpp -O2
#g++ -std=c++14 -o sample_calculator.exe -I ./include sample_program_calculator.cpp bignum.lib


CC=g++
CFLAGS= -I ./include -c -Wall
SRC = ./source/
OUT = ./obj/

all: bignum.lib sample_program_calculator.cpp 
	make lib
	make test

test: bignum.lib sample_program_calculator.cpp
	@echo g++ -o sample_program.exe sample_program_calculator.cpp bignum.lib
	@./sample_program.exe

lib: library

library: $(OUT)constructors.o $(OUT)comparison_operators.o $(OUT)errorhandling.o $(OUT)io_operators.o $(OUT)arithmetic_operators.o $(OUT)modify.o $(OUT)str_arithmetic_algorithm.o
	@echo "building single static library : bignum.lib"
	@ar rvs bignum.lib $(OUT)*.o

$(OUT)constructors.o : $(SRC)constructors.cpp
	@echo "compiling source code to object files..."
	@$(CC) $(CFLAGS) $(SRC)constructors.cpp -o obj/constructors.o

$(OUT)comparison_operators.o : $(SRC)comparison_operators.cpp
	@echo "compiling source code to object files..."
	@$(CC) $(CFLAGS) $(SRC)comparison_operators.cpp -o obj/comparison_operators.o

$(OUT)errorhandling.o : $(SRC)errorhandling.cpp
	@echo "compiling source code to object files..."
	@$(CC) $(CFLAGS) $(SRC)errorhandling.cpp -o obj/errorhandling.o

$(OUT)io_operators.o : $(SRC)io_operators.cpp
	@echo "compiling source code to object files..."
	@$(CC) $(CFLAGS) $(SRC)io_operators.cpp -o obj/io_operators.o

$(OUT)arithmetic_operators.o : $(SRC)arithmetic_operators.cpp
	@echo "compiling source code to object files..."
	@$(CC) $(CFLAGS) $(SRC)arithmetic_operators.cpp -o obj/arithmetic_operators.o

$(OUT)modify.o : $(SRC)modify.cpp
	@echo "compiling source code to object files..."
	@$(CC) $(CFLAGS) $(SRC)modify.cpp -o obj/modify.o

$(OUT)str_arithmetic_algorithm.o : $(SRC)str_arithmetic_algorithm.cpp
	@echo "compiling source code to object files..."
	@$(CC) $(CFLAGS) $(SRC)str_arithmetic_algorithm.cpp -o obj/str_arithmetic_algorithm.o

clean:
	@echo "removed : bignum.lib and sample_calculator.exe"
	@rm bignum.lib sample_calculator.exe *.o
