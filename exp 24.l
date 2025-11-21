%{
#include <stdio.h>
%}
%%
[0-9]+              { printf("NUMBER : %s\n", yytext); }
[A-Za-z]+           { printf("WORD   : %s\n", yytext); }
[ \t\n]+            ;      
.                   ;      
%%
int main()
{
    printf("Enter a statement:\n");
    yylex();
    return 0;
}
int yywrap()
{
    return 1;
}
