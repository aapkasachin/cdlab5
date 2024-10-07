%{
#include "y.tab.h"
#include<string.h>
#include<stdlib.h>
%}

%%
"int"   {return INT;}
"float" {return FLOAT;} 
"char"  {return CHAR;}
"double" {return DOUBLE;}
[_a-zA-Z][_a-zA-Z0-9]* {yylval.str=strdup(yytext);return IDENTIFIER;}
[0-9]+ {return NUM;}
"," {return ',';}
";" {return ';';}
"[" {return '[';}
"]" {return ']';}
. { }
\n {return 0;}
%%

int yywrap()
{
   return 1;
}

