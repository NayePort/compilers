%{
#include "nomina.tab.h"
#include <stdio.h>
#include <string.h>
%}

%%

"salario"             return SALARIO;
"horas"               return HORAS;
"empleado"            return EMPLEADO;

[0-9]+(\.[0-9]+)?    {
                        yylval.fval = atof(yytext);
                        return NUMBER;
                     }

[a-zA-Z][a-zA-Z0-9]* {
                        yylval.sval = strdup(yytext);
                        return NAME;
                     }

"="                     return EQUAL;
";"                     return SEMICOLON;
","                     return COMA;

[ \t\n]+                ;  /* Ignorar espacios en blanco */

.                       return yytext[0];
%%

int yywrap() {
    return 1;
}

/*Cinthia Portillo*/
