# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyoh <hyoh@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/10 14:01:37 by hyoh              #+#    #+#              #
#    Updated: 2022/09/28 16:41:47 by hyoh             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

CC = gcc
CFLAG = -Wall -Wextra -Werror
RM = rm -f
AR = ar -crs

SRCS	=	ft_printf.c \
			option.c \
			type.c \
			put.c \
			getlen.c

SRCS_BN	=	ft_printf_bonus.c \
			option_bonus.c \
			type_bonus.c \
			put_bonus.c \
			getlen_bonus.c

OBJS = $(SRCS:.c=.o)
OBJS_BN = $(SRCS_BN:.c=.o)

ifdef WITH_BONUS
	OBJS += $(OBJS_BN)
endif

all : $(NAME)

bonus :
	make WITH_BONUS=1 all

%.o : %.c
	$(CC) $(CFLAG) -c $< -o $@

$(NAME) : $(OBJS)
	$(AR) $@ $^

clean :
	$(RM) $(OBJS) $(OBJS_BN)

fclean : clean
	$(RM) $(NAME)

re : fclean all

.PHONY : all clean fclean re bonus
