MAIN = main
GNUPLOT_I = gnuplot_i

GNUPLOT_I_DIR = "./gnuplot_i"
INC = -I$(GNUPLOT_I_DIR)
OBJ_DIR = ./obj
OBJS = $(MAIN).o $(GNUPLOT_I).o
OBJS_OUT = $(addprefix $(OBJ_DIR)/,$(OBJS))

EXE = "gnuplotTest"

CFLAGS = -Wall
RM = rm -rf
CC = gcc $(CFLAGS) $(INC)

$(EXE): $(OBJ_DIR) $(OBJS_OUT)
	$(CC) $(OBJS_OUT) -lm -o $(EXE)

$(OBJ_DIR): $(OBJ_DIR)
	mkdir $(OBJ_DIR)
	
$(OBJ_DIR)/$(MAIN).o: $(MAIN).c
	$(CC) -c $(MAIN).c -o $(OBJ_DIR)/$(MAIN).o

$(OBJ_DIR)/$(GNUPLOT_I).o:
	$(CC) -c $(GNUPLOT_I_DIR)/$(GNUPLOT_I).c -o $(OBJ_DIR)/$(GNUPLOT_I).o
	
clean:
	$(RM) $(OBJ_DIR) $(EXE)	 *.png
