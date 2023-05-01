
%{
  open Ast

  (*Le parseur doit générer des Ast.program.
    Pour les annotation, il vous suffit de créer l’annotation avec [Annotation.create $loc] qui sera ce qu’il vous faut dans tous les cas :
    $loc est un paramètre qui correspond aux positions délimitant la chaîne de caractères parsée par la règle où il est utilisé,
    ce qui est exactement ce qu’il faut mettre dans l’annotation.*)
%}

%token EOF
%token <bool> BOOL_LITERAL
%token <string> STRING
%token <float> FLOAT
%token <int> INT
%token <string> ID
%token BOOL_TYP
%token FLOAT_TYP 
%token INT_TYP
%token POINT 
%token LIST 
%token ADD 
%token SUB 
%token MUL 
%token DIV 
%token MOD 
%token AND 
%token OR 
%token EQ 
%token NE 
%token LT 
%token GT 
%token LE 
%token GE 
%token NOT 
%token HEAD 
%token TAIL 
%token FLOOR 
%token FLOAT_OF_INT
%token COS 
%token SIN 
%token USUB
%token COLOR 
%token POS 
%token X 
%token Y
%token PI
%token BLUE 
%token RED 
%token GREEN 
%token PRINT 
%token COPY 
%token IF 
%token ELSE 
%token FOR 
%token FROM 
%token TO 
%token STEP 
%token FOREACH 
%token IN
%token DRAW 
%token CONS 
%token DOT 
%token COMMA 
%token SEMICOLON 
%token BEGIN 
%token END 
%token LPAR
%token RPAR 
%token LCUR 
%token RCUR

%nonassoc ELSE
%left OR
%left AND
%left EQ NE
%left LT GT LE GE
%left ADD SUB
%left MUL DIV MOD
%nonassoc NOT HEAD TAIL FLOOR FLOAT_OF_INT COS SIN USUB

%start <program> main

%%

main:
    | program EOF { $1 }

program:
    | LT argument_list GT statement { Program($2, $4) }
    | statement { Program([], $1) }

argument_list:
    | argument SEMICOLON argument_list { $1 :: $3 } (* not empty -> pop the first *)
    | argument { [$1] }
    | { [] } (* empty statements list *)

argument:
    | type_expr LPAR ID RPAR { Argument($3, $1, Annotation.create $loc) }
 
statement:
    | COPY LPAR expression COMMA expression RPAR { Assignment($3, $5, Annotation.create $loc) }
    | type_expr LPAR ID RPAR { Variable_declaration($3, $1, Annotation.create $loc)}
    | BEGIN statement_list END { Block($2, Annotation.create $loc) }
    | IF LPAR expression RPAR statement else_statement { IfThenElse($3, $5, $6, Annotation.create $loc) } //PB ICI
    | FOR ID FROM expression TO expression STEP expression statement { For($2, $4, $6, $8, $9, Annotation.create $loc) }
    | FOREACH ID IN expression statement { Foreach($2, $4, $5, Annotation.create $loc) }
    | DRAW LPAR expression RPAR { Draw($3, Annotation.create $loc) }
    | PRINT LPAR expression RPAR { Print($3, Annotation.create $loc) }

%inline else_statement:
    | ELSE statement { $2 }
    | { Nop } //PB ICI

statement_list:
    | statement SEMICOLON statement_list { $1 :: $3 } (* not empty -> pop the first *)
    | statement { [$1] }
    (*| { [] }  empty statements list *)

expression:
    | expression binary_operator expression { Binary_operator($2, $1, $3, Annotation.create $loc) } //PB ICI
    | unary_operator expression { Unary_operator($1, $2, Annotation.create $loc) }  //PB ICI
    | base_expression DOT field_accessor { Field_accessor($3, $1, Annotation.create $loc) }  //PETIT PB ICI
    | base_expression CONS cons_expression { Cons($1, $3, Annotation.create $loc) }   //PB ICI
    | base_expression { $1 }

cons_expression:
    | base_expression { $1 }

base_expression:
    | INT { Constant_i($1, Annotation.create $loc) }
    | FLOAT { Constant_f($1, Annotation.create $loc) }
    | BOOL_LITERAL { Constant_b($1, Annotation.create $loc) }
    | PI { Constant_f(Float.pi, Annotation.create $loc) }
    | POS LPAR expression COMMA expression RPAR { Pos($3, $5, Annotation.create $loc) }
    | COLOR LPAR expression COMMA expression COMMA expression RPAR { Color($3, $5, $7, Annotation.create $loc) }
    | POINT LPAR expression COMMA expression RPAR { Point($3, $5, Annotation.create $loc) }
    | ID { Variable($1, Annotation.create $loc) }
    | LCUR expression_list RCUR { List($2, Annotation.create $loc) }
    | LPAR expression RPAR { $2 }

expression_list:
    | expression { [$1] }
    | expression COMMA expression_list { $1 :: $3 } (* not empty -> pop the first *)    
    | { [] } (* empty expression list *)

field_accessor:
  | COLOR { Color_accessor }
  | POS { Position_accessor }
  | X { X_accessor }
  | Y { Y_accessor }
  | BLUE { Blue_accessor }
  | RED { Red_accessor }
  | GREEN { Green_accessor }

%inline unary_operator:
  | USUB { USub }
  | NOT { Not }
  | HEAD { Head }
  | TAIL { Tail }
  | FLOOR { Floor }
  | FLOAT_OF_INT { Float_of_int }
  | COS  { Cos }
  | SIN { Sin }

%inline binary_operator:
    | ADD { Add }
    | SUB { Sub }
    | MUL { Mul }
    | DIV { Div }
    | MOD { Mod }
    | AND { And }
    | OR { Or }
    | EQ { Eq }
    | NE { Ne }
    | LT { Lt }
    | GT { Gt }
    | LE { Le }
    | GE { Ge }

type_expr:
    | INT_TYP { Type_int }
    | FLOAT_TYP { Type_float }
    | BOOL_TYP { Type_bool }
    | POS { Type_pos }
    | COLOR { Type_color }
    | POINT { Type_point }
    | LIST LPAR type_expr RPAR { Type_list($3) }
