ASS = nasm 
NAME = libasm.a
FLAGS = -f elf64
SRC = ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s \

BONUS = ft_atoi_base.s \
		ft_create_elem.s \
		ft_list_push_front.s \
		ft_list_size.s \
		ft_list_sort.s \
		ft_list_remove_if.s \
		ft_atoi_base_test.c

OBJ = $(SRC:.s=.o)
BONUS_OBJ =  $(BONUS:.s=.o) $(BONUS:.c=.o)

all: $(NAME)

$(NAME) : $(OBJ)
	ar rc libasm.a $(OBJ)
	ranlib libasm.a

.s.o:
	$(ASS) $(FLAGS) $< -o $@

bonus: $(BONUS_OBJ)
	ar rc libasm.a $(BONUS_OBJ)
	ranlib libasm.a

clean:
	rm -rf *.o

fclean: clean
	rm -rf libasm.a

.PHONY: all clean fclean re
