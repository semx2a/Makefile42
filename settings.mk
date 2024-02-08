ifndef SETTINGS_MK
	SETTINGS_MK := 1

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::TARGET::

NAME	=	executablename

ifeq ($(MAKECMDGOALS), bonus)
NAME	=	executablename_bonus
endif

UNAME	=	$(shell uname)

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::SOURCE::


# You can add more subfolders using the same pattern.
# $S is the path to the source folder. Do not forget to add a '\' 
# at the end of each line, but not the last one.
SRC		=	$(addprefix $Ssubfolder, \
				nameofyourfile.c \
				nameofyourfile1.c) \
			$(addprefix $Sothersubfoler, \
				nameofyourfile.c \
				nameofyourfile1.c)

ifeq ($(MAKECMDGOALS), bonus)
SRC		=	$(addprefix $Ssubfolder_bonus, \
				nameofyourfile_bonus.c \
				nameofyourfile1_bonus.c) \
			$(addprefix $Sothersubfoler_bonus, \
				nameofyourfile_bonus.c \
				nameofyourfile1_bonus.c)
endif

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::COMPILERS::

CC		=	gcc

ifeq ($(UNAME), Darwin)
CC	=	clang
endif

CFLAGS	=	-Wall -Wextra -Werror

AR		=	ar

ARFLAGS	=	rcs

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::LIBRARY::

# If you are using a library, set IS_LIB to true.
IS_LIB	= 	false

LIB		= 	$Llibft.a

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::FT_PRINTF::

IS_PTF	= 	false

PTF		= 	$Plibftprintf.a

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::MINILIBX::

IS_MLX	= 	false

MLX		= 	$Mlibmlx_$(UNAME).a

endif