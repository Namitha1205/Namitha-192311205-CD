%{
#include <stdio.h>
%}
%%
abc        { printf("ABC"); }   // Replace abc → ABC
.          { printf("%s", yytext); }   // Print all other characters
%%
int main()
{
    printf("Enter the input string:\n");
    yylex();
    return 0;
}
int yywrap()
{
    return 1;
}
