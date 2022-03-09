# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seozcan <seozcan@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/07 19:14:12 by seozcan           #+#    #+#              #
#    Updated: 2022/03/09 18:37:18 by seozcan          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::TARGET::

NAME	= 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::SOURCES::

SDIR	= srcs/

ODIR	= objs/

SRCS	=  

OBJS	= ${SRCS:.c=.o}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::FUNCTIONS::

FDIR	= fcts/

FSRCS	= 

FOBJS	= ${FSRCS:.c=.o}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::BONUS::

BDIR	= bonus/

BSRCS	= 

BOBJS	= ${BSRCS:.c=.o}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::COMPILERS::

CC		= gcc

WFLAGS	= -Wall -Wextra -Werror

AR		= ar

ARFLAGS	= rcs

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::HEADERS::

IDIR	= inc/

INC		= 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::LIBRARY::

IS_LIBFT	= true

LDIR 	= libft/

LIB		= libft.a

LINC	= $(addprefix $(LDIR), inc) 

LIBFT_COMPLETE	= $(addprefix $(LDIR), ${LIB})

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::COLORS::

BLUE		=	\033[1;34m
CYAN		=	\033[0;36m
GREEN		=	\033[0;92m
ORANGE  	=	\033[0;33m
NO_COLOR	=	\033[m
PURPLE		=	\033[0;35m
BPURPLE		=	\033[1;35m
BCYAN		=	\033[1;36m
ICYAN		=	\033[3;36m

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::PARAMS::

INCLUDE_FLAGS 	=	$(addprefix -I , $(IDIR))

ifeq ($(IS_LIBFT),true)
	INCLUDE_FLAGS	+=	$(addprefix -I , ${LINC})
endif

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::RULES::


all:		header lib clean $(NAME)
	@$(CC) -o $(NAME) $(wildcard $(ODIR)*.o) $(LIBFT_COMPLETE)
	@echo "$(GREEN)mandatory exe:\t\t\t\t\t\t[OK]$(NO_COLOR)"

bonus:		header lib clean o_dir
	@$(CC) $(WFLAGS) -I $(IDIR) -c $(addprefix $(BDIR), $(BSRCS)) $(addprefix $(FDIR), $(FSRCS))
	@echo "$(GREEN)bonus compilation:\t\t\t\t\t[OK]$(NO_COLOR)"
	@mv *.o $(ODIR)
	@$(CC) -o $(NAME) $(ODIR)*.o
	@echo "$(GREEN)bonus exe:\t\t\t\t\t\t[OK]$(NO_COLOR)"
	@make -s clean

$(NAME):	o_dir	
	@$(CC) $(WFLAGS) $(ICLUDE_FLAGS) -c $(addprefix $(SDIR), $(SRCS)) $(addprefix $(FDIR), $(FSRCS))
	@echo "$(GREEN)mandatory compilation:\t\t\t\t\t[OK]$(NO_COLOR)"
	@mv $(OBJS) $(FOBJS) $(ODIR)

lib:
	@make -C $(LDIR) --quiet

header:
	@echo -n "$(BPURPLE)"
	@echo "   ______________________________________________________"
	@echo "  /\     __________    ________    ___   ___    _______  \ "
	@echo " /  \   /\         \  /\   __  \  /\  \ /\  \  /\  ____\  \ "
	@echo "/    \  \ \  \ _/\  \ \ \   __  \ \ \  \ /_ /_ \ \  _\_/_  \ "
	@echo "\     \  \ \__\_/ \__\ \ \__\-\__\ \ \__\  \__\ \ \______\  \ "
	@echo " \     \  \/__/  \/__/  \/__/ /__/  \/__/ \/__/  \/______/   \ "
	@echo "  \     \_________ ___________________________________________\ "
	@echo "   \    /                                                     / "
	@echo "    \  /                   $(SCYAN) S E O Z C A N \
$(NO_COLOR)$(BPURPLE)            ____   / "
	@echo "     \/______________________________________________/\   \_/ "
	@echo "                                                     \ \___\ "
	@echo "                                                      \/___/ "
	@echo "$(NO_COLOR)"

o_dir:
	@mkdir -p $(ODIR)
	@echo "$(GREEN)objs folder:\t\t\t\t\t\t[OK]$(NO_COLOR)"

update: header fclean
	@git pull

push:	header fclean
	@echo -n "$(GREEN)"
	@git add .
	@git commit --quiet -m 'update'
	@git push --quiet
	@echo "$(GREEN)git push:\t\t\t\t\t\t[OK]$(NO_COLOR)"

clean:	header
ifneq ($(wildcard ./$(ODIR)),)
	@make -C $(LDIR) --quiet clean
	@rm -rf $(ODIR)
	@echo "$(GREEN)objs folder:\t\t\t\t\t\t[RM]$(NO_COLOR)"
else
	@make -C $(LDIR) --quiet clean
	@rm -f $(wildcard *.o)
	@echo "$(GREEN)obj files:\t\t\t\t\t\t[RM]$(NO_COLOR)"
endif

fclean:	header clean
	@make -C $(LDIR) --quiet fclean
	@rm -f $(NAME)
	@echo "$(GREEN)$(NAME) executable:\t\t\t\t\t[RM]$(NO_COLOR)"
	
re:		header fclean all 

.PHONY:	all bonus clean fclean re push update o_dir
