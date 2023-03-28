/*Logan Choi*/
/*Professor Morales*/
/*Bison File*/

%{
#include <iostream>
using namespace std;

extern int yylex();
extern int line_num;
extern char* yytext;

int yyerror(const char *p);
%}

%token K_PERIOD
%token K_LPAREN
%token K_RPAREN
%token K_PRINT
%token K_IF
%token K_COLON
%token K_ELSE
%token K_SC
%token K_LOOP

%token OP_ASSIGN
%token OP_NEG
%token OP_RELATION
%token OP_ADD
%token OP_MULT

%token T_INTEGER
%token T_DECIMAL
%token T_STRING
%token T_IDENT

%%
StatementSequence :  Statement
                     { cout << "RULE: StatementSequence ::= Statement" << endl; } 
                  |  Statement K_PERIOD StatementSequence
                     { cout << "RULE: StatementSequence ::= Statement . StatementSequence" << endl;}
		  ;

Statement  :   Assignment 
               { cout << "RULE: Statement ::= Assignment" << endl; }
            |  PrintStatement
               { cout << "RULE: Statement ::= PrintStatement" << endl; }
            |  IfStatement
               { cout << "RULE: Statement ::= IfStatement" << endl;}
            |  LoopStatement
               { cout << "RULE: Statemennt ::= LoopStatement" << endl;}   
	    ;

Assignment :  T_IDENT OP_ASSIGN Expression
              {cout << "RULE: Assignment ::= identifier <- Expression" << endl;}
	   ;

PrintStatement : K_PRINT K_LPAREN Expression K_RPAREN
                {cout << "RULE: PrintStatement ::= PRINT ( Expression )" << endl;}

	       ;

IfStatement : K_IF Expression K_COLON StatementSequence K_SC
              {cout << "RULE: IfStatement ::= IF Expression : StatementSequence ;" << endl;}
            | K_IF Expression K_COLON StatementSequence K_ELSE StatementSequence K_SC
	      {cout << "RULE: IfStatement ::= IF Expression : StatementSequence ELSE : StatementSequence ;" << endl;}
            ;

LoopStatement : K_LOOP Expression K_COLON StatementSequence K_SC
                {cout << "RULE: LoopStatement ::= LOOP Expressionn : StatementSequence ;" << endl;}
              ; 

Expression : SimpleExpression
              {cout << "RULE: Expression ::= SimpleExpression" << endl;}
            | SimpleExpression OP_RELATION Expression
              {cout << "RULE: Expression := SimpleExpression OP_RELATION Expression" << endl;}
            ;

SimpleExpression : Term
                   {cout << "RULE: SimpleExpression ::= Term" << endl;}
                 | Term OP_ADD SimpleExpression
                   {cout << "RULE: SimpleExpression ::= Term OP_ADD SimpleExpression" << endl;}
                 ;

Term        : Factor
              {cout << "RULE: Term ::= Factor" << endl;}
            | Factor OP_MULT Term
              {cout << "RULE: Term ::= Factor OP_MULT Term" << endl;}
            ;

Factor      : T_INTEGER
              {cout << "RULE: Factor ::= T_INTEGER" << endl;}
            | T_DECIMAL
              {cout << "RULE: Factor ::= T_DECIMAL" << endl;}
            | T_STRING
              {cout << "RULE: Factor ::= T_STRING" <<endl;}
            | T_IDENT
              {cout << "RULE: Factor ::= T_IDENT" << endl;}
            | K_LPAREN Expression K_RPAREN
              {cout << "RULE: Factor ::= ( Expression )" << endl;}
            | OP_NEG Factor
              {cout << "RULE: Factor ::= ~ Factor" << endl;}
	    ;

%%


int yyerror(const char *p)
{
  cout << "ERROR: In line " << line_num << " with token \'"
       << yytext << "\'" << endl;
  return 0;
}

int main()
{
  int failcode;
  failcode = yyparse();

  if (failcode)
    cout << "INVALID!" << endl;
  else
    cout << "CORRECT" << endl;
  return 0;
}
