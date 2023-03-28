/*Logan Choi*/
/*Professor Morales*/
/*Flex File*/

%{
#include <iostream>
#include <iomanip>
#include "puckparser.tab.h"
using namespace std;

int line_num = 1;

void writeToken(const char* toktype);
%}

%option noyywrap

WHITE      [ \t]
DIGIT      [0-9]
ALPHA      [a-zA-Z]
ALPHANUM   [a-zA-Z0-9]
NONWHITE   [^\r\n\t\f\v ]
RELATION   [<>=#]
ADD        "OR"|\+|\-|&
MULT       "AND"|\*|\/

%%
{WHITE}    ;               
\n         { line_num++; }

"."        { writeToken("K_PERIOD"); return K_PERIOD; }
"("        { writeToken("K_LPAREN"); return K_LPAREN; }
")"        { writeToken("K_RPAREN"); return K_RPAREN; }
"PRINT"    { writeToken("K_PRINT"); return K_PRINT; }
"IF"       { writeToken("K_IF"); return K_IF;}
":"        { writeToken("K_COLON"); return K_COLON;}
"ELSE:"    { writeToken("K_ELSE");  return K_ELSE;}
";"        { writeToken("K_SC");  return K_SC;}
"LOOP"     { writeToken("K_LOOP"); return K_LOOP;}


"<-"       { writeToken("OP_ASSIGN"); return OP_ASSIGN; }
"~"        { writeToken("OP_NEG");  return OP_NEG; }
{RELATION} { writeToken("OP_RELATION"); return OP_RELATION; }
{ADD}      { writeToken("OP_ADD"); return OP_ADD; }
{MULT}     { writeToken("OP_MULT"); return OP_MULT; }

[+-]?{DIGIT}+           { writeToken("T_INTEGER"); return T_INTEGER; }
[+-]?{DIGIT}+\.{DIGIT}+ { writeToken("T_DECIMAL"); return T_DECIMAL; }
\"{NONWHITE}*\"         { writeToken("T_STRING"); return T_STRING; }
[a-zA-Z][_a-zA-Z0-9]*   { writeToken("T_IDENT"); return T_IDENT; }
%%


void writeToken(const char* toktype)
{ 
  cout << "TOKEN: ";
  cout << left << setw(14) << toktype;
  cout << "LEXEME: " << yytext << endl;
}
