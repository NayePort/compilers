%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>



#define IMPUESTO 0.10 //imp del 10%


void yyerror(const char *s);
int yylex(void);

%}

%union {
    float fval;    /*float value*/
    char* sval;
    
}

%token <fval> NUMBER   
%token <sval> NAME     
%token SALARIO HORAS EMPLEADO
%token EQUAL SEMICOLON COMA

%type <fval> salario horas
%type <sval> empleado

%%

programa:
	    empleados
    ;

empleados:
	     empleado SEMICOLON empleados
    | empleado SEMICOLON
    ;


empleado:
	    EMPLEADO NAME COMA salario horas
    {
        printf("Empleado: %s\n", $2);
        printf("Salario bruto: $%.2f\n", $4 * $5);
        float salario_bruto = $4 * $5;
        float impuestos = salario_bruto * IMPUESTO;
        float salario_neto = salario_bruto - impuestos;
        printf("Impuestos (%.0f%%): $%.2f\n", IMPUESTO * 100, impuestos);
        printf("Salario neto: $%.2f\n\n", salario_neto);
    }
    ;

salario:
           SALARIO EQUAL NUMBER
           { $$ = $3; }
           ;

horas:
           HORAS EQUAL NUMBER 
           { $$ = $3; }
           ;

%%

void yyerror(const char *s) {
   fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Nomina del empleado\n");
    printf("capture datos con el siguiente formato:\n");
    printf("empleado Juan, salario=24.00 horas=38;\n");
    printf("=======================================\n\n");
    yyparse();
    return 0;
}

/*Cinthia Portillo*/
