%{
int macro_count=0;
int header_count=0;
%}
%%
"#define"      { macro_count++; }
"#include"     { header_count++; }
.|\n           ;
%%
int yywrap() { return 1; }

int main(int argc, char *argv[]) {
    if(argc > 1) {
        yyin = fopen(argv[1], "r");
    }
    yylex();
    printf("Macros: %d\n", macro_count);
    printf("Header files: %d\n", header_count);
    return 0;
}

