# Compilador C
CC = gcc
# Flags do compilador (Otimização -O2, todos os avisos -Wall)
CFLAGS = -O2 -Wall
# Biblioteca do Flex
LDLIBS = -lfl

# Nome do programa final
PROG = analisador

# Arquivos gerados pelo Flex
LEXER_C = lex.yy.c
LEXER_L = flex.l

# Regra padrão: criar o programa
all: $(PROG)

# Regra para linkar o programa final
$(PROG): $(LEXER_C)
	$(CC) $(CFLAGS) -o $(PROG) $(LEXER_C) $(LDLIBS)
	@echo "Analisador léxico '$(PROG)' compilado com sucesso."

# Regra para gerar o analisador em C a partir do arquivo .l
$(LEXER_C): $(LEXER_L)
	flex $(LEXER_L)

# Regra para limpar os arquivos gerados
clean:
	rm -f $(PROG) $(LEXER_C)
	@echo "Arquivos gerados foram removidos."