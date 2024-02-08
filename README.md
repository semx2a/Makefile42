# Makefile42

This repo contains the Makefile that I wrote for my school projects at [`42 School`](https://42.fr/en/homepage/) in Paris.

## Usage

To use the Makefile, simply copy the `Makefile` to your project's root directory and customize the following variables:

In the `settings.mk` file:
```makefile
NAME=your_executable_name
SRC=your_source_files
IS_LIB=true/false
IS_PTF=true/false
IS_MLX=true/false
```

To compile your project, simply run the following command:
```bash
make
```

To clean your project's object files, run the following command:
```bash
make clean
```

To clean your project's object files and the executable, run the following command:
```bash
make fclean
```
If you wish to compile your project with debug flags, run the following command:
```bash
make debug # -g
make sanaddr # -fsanitize=address
make santhread # -fsanitize=thread
```