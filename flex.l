%{
#include <stdio.h>


int linha_atual = 1;
%}

%option noyywrap

%%

"caso"			{ printf("LINHA %d: TOKEN T_CASO, Lexema '%s'\n", linha_atual, yytext); }
"caso_nao"		{ printf("LINHA %d: TOKEN T_CASO_NAO, Lexema '%s'\n", linha_atual, yytext); }
"fazer"			{ printf("LINHA %d: TOKEN T_FAZER, Lexema '%s'\n", linha_atual, yytext); }
"enquanto"		{ printf("LINHA %d: TOKEN T_ENQUANTO, Lexema '%s'\n", linha_atual, yytext); }
"para"			{ printf("LINHA %d: TOKEN T_PARA, Lexema '%s'\n", linha_atual, yytext); }
"funcao"		{ printf("LINHA %d: TOKEN T_FUNCAO, Lexema '%s'\n", linha_atual, yytext); }
"retornar"		{ printf("LINHA %d: TOKEN T_RETORNAR, Lexema '%s'\n", linha_atual, yytext); }
"ler"			{ printf("LINHA %d: TOKEN T_LER, Lexema '%s'\n", linha_atual, yytext); }
"escrever"		{ printf("LINHA %d: TOKEN T_ESCREVER, Lexema '%s'\n", linha_atual, yytext); }
"inteiro"		{ printf("LINHA %d: TOKEN T_TIPO_INT, Lexema '%s'\n", linha_atual, yytext); }
"real"			{ printf("LINHA %d: TOKEN T_TIPO_REAL, Lexema '%s'\n", linha_atual, yytext); }
"texto"			{ printf("LINHA %d: TOKEN T_TIPO_TEXTO, Lexema '%s'\n", linha_atual, yytext); }
"vazio"			{ printf("LINHA %d: TOKEN T_TIPO_VAZIO, Lexema '%s'\n", linha_atual, yytext); }
"e"			{ printf("LINHA %d: TOKEN T_OP_E, Lexema '%s'\n", linha_atual, yytext); }
"ou"			{ printf("LINHA %d: TOKEN T_OP_OU, Lexema '%s'\n", linha_atual, yytext); }

[0-9]+			{ printf("LINHA %d: TOKEN T_LITERAL_INT, Lexema '%s'\n", linha_atual, yytext); }
[0-9]+"."[0-9]+		{ printf("LINHA %d: TOKEN T_LITERAL_REAL, Lexema '%s'\n", linha_atual, yytext); }
\"([^\"\\]|\\.)*\"	{ printf("LINHA %d: TOKEN T_LITERAL_TEXTO, Lexema '%s'\n", linha_atual, yytext); }

[a-zA-Z_][a-zA-Z0-9_]*	{ printf("LINHA %d: TOKEN T_IDENTIFICADOR, Lexema '%s'\n", linha_atual, yytext); }

"+"			{ printf("LINHA %d: TOKEN T_OP_SOMA, Lexema '%s'\n", linha_atual, yytext); }
"-"			{ printf("LINHA %d: TOKEN T_OP_SUB, Lexema '%s'\n", linha_atual, yytext); }
"*"			{ printf("LINHA %d: TOKEN T_OP_MUL, Lexema '%s'\n", linha_atual, yytext); }
"/"			{ printf("LINHA %d: TOKEN T_OP_DIV, Lexema '%s'\n", linha_atual, yytext); }
"%"			{ printf("LINHA %d: TOKEN T_OP_MOD, Lexema '%s'\n", linha_atual, yytext); }
"=="			{ printf("LINHA %d: TOKEN T_OP_IGUAL, Lexema '%s'\n", linha_atual, yytext); }
"!="			{ printf("LINHA %d: TOKEN T_OP_DIF, Lexema '%s'\n", linha_atual, yytext); }
"<="			{ printf("LINHA %d: TOKEN T_OP_MENOR_IGUAL, Lexema '%s'\n", linha_atual, yytext); }
">="			{ printf("LINHA %d: TOKEN T_OP_MAIOR_IGUAL, Lexema '%s'\n", linha_atual, yytext); }
"<"			{ printf("LINHA %d: TOKEN T_OP_MENOR, Lexema '%s'\n", linha_atual, yytext); }
">"			{ printf("LINHA %d: TOKEN T_OP_MAIOR, Lexema '%s'\n", linha_atual, yytext); }
"!"			{ printf("LINHA %d: TOKEN T_OP_NEG, Lexema '%s'\n", linha_atual, yytext); }
"="			{ printf("LINHA %d: TOKEN T_ATRIBUICAO, Lexema '%s'\n", linha_atual, yytext); }
"("			{ printf("LINHA %d: TOKEN T_ABRE_PAR, Lexema '%s'\n", linha_atual, yytext); }
")"			{ printf("LINHA %d: TOKEN T_FECHA_PAR, Lexema '%s'\n", linha_atual, yytext); }
"{"			{ printf("LINHA %d: TOKEN T_ABRE_CHAVE, Lexema '%s'\n", linha_atual, yytext); }
"}"			{ printf("LINHA %d: TOKEN T_FECHA_CHAVE, Lexema '%s'\n", linha_atual, yytext); }
";"			{ printf("LINHA %d: TOKEN T_PONTO_VIRG, Lexema '%s'\n", linha_atual, yytext); }
","			{ printf("LINHA %d: TOKEN T_VIRGULA, Lexema '%s'\n", linha_atual, yytext); }

"//".*			{ /* Ignora comentários de linha única */ }
[ \t]+			{ /* Ignora espaços e tabs */ }
"\n"			{ linha_atual++; /* Incrementa a linha e ignora a quebra de linha */ }
.			{ fprintf(stderr, "ERRO LÉXICO na linha %d: Caractere inválido '%s'\n", linha_atual, yytext); }

%%

extern FILE *yyin;

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Uso: %s <arquivo_fonte>\n", argv[0]);
        return 1;
    }

    FILE *arquivo = fopen(argv[1], "r");
    if (!arquivo) {
        perror("Nao foi possivel abrir o arquivo");
        return 1;
    }

    yyin = arquivo;

    yylex();

    fclose(arquivo);

    return 0;
}
