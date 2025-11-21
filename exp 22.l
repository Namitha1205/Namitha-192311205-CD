%{
#include <stdio.h>
#include <string.h>

char *kw[] = {"int","void","float","char","return","include","main"};
int iskw(char *s) {
    for(int i=0;i<7;i++)
        if(strcmp(s,kw[i])==0) return 1;
    return 0;
}
%}
%%
\".*\"              { printf("<STRING> %s\n", yytext); }
[0-9]+              { printf("<NUMBER> %s\n", yytext); }
[A-Za-z_][A-Za-z0-9_]* {
                        if(iskw(yytext))
                            printf("<KEYWORD> %s\n", yytext);
                        else
                            printf("<IDENTIFIER> %s\n", yytext);
                     }
"="|"+"|"-"|"*"|"/" { printf("<OPERATOR> %s\n", yytext); }
[(){};,]            { printf("<SYMBOL> %s\n", yytext); }
[ \t\n]+            ;    // ignore spaces
.                   { printf("<UNKNOWN> %s\n", yytext); }
%%
int main(int argc,char *argv[])
{
    yyin = fopen(argv[1], "r");
    if(!yyin){ printf("File error\n"); return 0; }
    yylex();
    return 0;
}

int yywrap(){ return 1; }
