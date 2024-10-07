%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int yylex();
void yyerror(char *s);
extern int yylineno;
int var_count=0;
%}

%union 
{
  char *str;
}
%token INT FLOAT CHAR DOUBLE NUM
%token<str> IDENTIFIER

%%
program:declarations
        ;
declarations:declarations declaration ';'
            |declaration ';'
            ;
declaration:type var_list 
           ;
type:INT
    |FLOAT
    |DOUBLE
    |CHAR 
    ;
var_list:var_list ',' var
        |var
        ;
var:identifier
   |identifier '[' ']'
   |identifier '[' NUM ']'
   ;
identifier:IDENTIFIER {var_count++;}
          ;
%%

int main()
{
   printf("enter the expression:\n");
   yyparse();
   printf("the number of variables declared are %d",var_count);
   return 0;
}

void yyerror(char *s)
{
   fprintf(stderr,"%d  %s",yylineno,s);
   exit(0);
}

