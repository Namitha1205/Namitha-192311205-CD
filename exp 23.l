%{
#include <stdio.h>
int positive = 0;
int negative = 0;
%}

%%
-[0-9]+        { negative++; printf("NEGATIVE : %s\n", yytext); }
[0-9]+         { positive++; printf("POSITIVE : %s\n", yytext); }
[ \t\n]+       ;     
.              ;     
%%
int main()
{
    printf("Enter numbers:\n");
    yylex();
    printf("\nTotal Positive Numbers = %d\n", positive);
    printf("Total Negative Numbers = %d\n", negative);
    return 0;
}
int yywrap()
{
    return 1;
}
