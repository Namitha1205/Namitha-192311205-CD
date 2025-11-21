%{
#include <stdio.h>
%}

%%

https?:\/\/[a-zA-Z0-9\/\.\-]+     { printf("Valid URL\n"); }

.*                                { printf("Invalid URL\n"); }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
