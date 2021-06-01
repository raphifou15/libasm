ASS = nasm 
NAME = libasm.a
FLAGS = -f elf64
SRC = ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s \

OBJ = $(SRC:.s=.o)

all: $(NAME)

$(NAME) : $(OBJ)
	ar rc libasm.a $(OBJ)
	ranlib libasm.a

.s.o:
	$(ASS) $(FLAGS) $< -o $@

clean:
	rm -rf *.o

fclean: clean
	rm -rf libasm.a

re:	fclean all
