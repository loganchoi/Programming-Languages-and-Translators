/*Logan Choi*/
/*Professor Morales*/
/*Flex File*/
		               /* ---- PROLOGUE ---- */
%{
#include <iostream>
#include <iomanip>
using namespace std;

int num_lines = 0;
int count = 0;
%}
		              /* ---- DEFINITIONS ---- */
%option noyywrap
DIGIT		[0-9]
NONZERO         [1-9]
KEY             "PRINT"|"ELSE"|"LOOP"|"RETURN"
NONWHITE        [^\r\n\t\f\v ]
HEX             [A-F0-9]
OP              [\+\-\*\/\<\>\=\&\#]

%%                /* ---- REGULAR EXPRESSIONS ---- */


[ \t]                                                    ;
\n                                                       {num_lines++;}
[+-]?{DIGIT}+                                            {cout << count++ << ": TOKEN: INTCONST"<< setw(11) << "LEXEME: " << yytext << endl;}
[+-]?{DIGIT}+\.{DIGIT}+                                  {cout << count++ << ": TOKEN: DECCONST"<< setw(11) << "LEXEME: " << yytext << endl;}
[+-]?{DIGIT}+\.{DIGIT}+E[+-]?{DIGIT}*{NONZERO}{DIGIT}*   {cout << count++ << ": TOKEN: SCICONST"<< setw(11) << "LEXEME: " << yytext << endl;}
[0-9A-F]+H                                               {cout << count++ << ": TOKEN: HEXCONST"<< setw(11) << "LEXEME: " << yytext << endl;}
[0-1]+B                                                  {cout << count++ << ": TOKEN: BINCONST"<< setw(11) << "LEXEME: " << yytext << endl;}
{KEY}                                                    {cout << count++ << ": TOKEN: KEYWORD"<< setw(12) << "LEXEME: " << yytext << endl;}
\"{NONWHITE}*\"                                          {cout << count++ << ": TOKEN: STRCONST"<< setw(11) << "LEXEME: " << yytext << endl;}
{HEX}{HEX}X                                              {cout << count++ << ": TOKEN: CHCONST"<< setw(12) << "LEXEME: " << yytext << endl;}
[a-zA-Z][_a-zA-Z0-9]*                                    {cout << count++ << ": TOKEN: IDENT"<< setw(14) << "LEXEME: " << yytext << endl;}
{OP}                                                     {cout << count++ << ": TOKEN: OPERATOR"<< setw(11) << "LEXEME: " << yytext << endl;}
%.*                                                      ;
.                                                        {cout << count++ << ": TOKEN: ?"<< setw(18) << "LEXEME: " << yytext << endl;}


%%                /* ---- EPILOGUE ---- */

int main()
{
    yylex();
    cout << num_lines << " lines processed." << endl;
    return 0;
}
