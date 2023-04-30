
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
%token COLOR 
%token POS 
%token X 
%token Y 
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
%token LSQ 
%token RSQ

%nonassoc ELSE
%left AND OR
%left EQ NE LT GT LE GE
%left ADD SUB 
%left MUL DIV MOD
%nonassoc NOT

%start <program> main

%%

main:
    | p = program EOF { p }
    | EOF { Program([], Block([], Annotation.create $loc)) }

program:
    | LT a = argument_list GT s = statement_list { Program(a, Block(s, Annotation.create $loc)) }
    | s = statement_list { Program([], Block(s, Annotation.create $loc)) }(* A verifier *)

argument_list:
    | a1 = argument SEMICOLON a2 = argument_list { a1 :: a2 } (* not empty -> pop the first *)
    | a = argument { [a] }
    | { [] } (* empty statements list *)

argument:
    | a1 = STRING a2 = type_expr { Argument(a1, a2, Annotation.create $loc) }
 
statement:
    | COPY LPAR e1 = expression COMMA e2 = expression RPAR SEMICOLON { Assignment(e1, e2, Annotation.create $loc) }
    | t = type_expr LPAR e = ID RPAR SEMICOLON { Variable_declaration(e, t, Annotation.create $loc)}
    | BEGIN s = statement_list END { Block([s], Annotation.create $loc) }
    | IF LPAR e = expression RPAR s1 = statement SEMICOLON { IfThenElse(e, s1, Nop, Annotation.create $loc) }
    | IF LPAR e = expression RPAR s1 = statement ELSE s2 = statement SEMICOLON { IfThenElse(e, s1, s2, Annotation.create $loc) }
    | FOR n = ID FROM e1 = expression TO e2 = expression STEP e3 = expression s = statement_list { For(n, e1, e2, e3, Block(s, Annotation.create $loc), Annotation.create $loc) }
    | FOREACH n = ID IN e = expression s = statement_list { Foreach(n ,e , Block(s, Annotation.create $loc), Annotation.create $loc) }
    | DRAW LPAR e = expression RPAR { Draw(e, Annotation.create $loc) }
    | PRINT LPAR e = expression RPAR { Print(e, Annotation.create $loc) }
    | { Nop } (* A verifier *)

statement_list:
    | s1 = statement SEMICOLON s2 = statement_list { s1 :: s2 } (* not empty -> pop the first *)
    | s = statement { [s] }
    | { [] } (* empty statements list *)

expression:
    | i = INT { Constant_i(i, Annotation.create $loc) }
    | f = FLOAT { Constant_f(f, Annotation.create $loc) }
    | PI {Constant_float(Float.pi, Annotation.create $loc)}
    | b = BOOL_LITERAL { Constant_b(b, Annotation.create $loc) }
    | POS LPAR e1 = expression COMMA e2 = expression RPAR { Pos(e1, e2, Annotation.create $loc) }
    | COLOR LPAR e1 = expression COMMA e2 = expression COMMA e3 = expression RPAR { Color(e1, e2, e3, Annotation.create $loc) }
    | POINT LPAR e1 = expression COMMA e2 = expression RPAR { Point(e1, e2, Annotation.create $loc) }
    | e1 = ID { Variable(e1, Annotation.create $loc) }
    | e1 = expression e2 = binary_operator e3 = expression { Binary_operator(e2, e1, e3, Annotation.create $loc) }
    | e1 = unary_operator e2 = expression { Unary_operator(e1, e2, Annotation.create $loc) }
    | e = expression DOT f = field_accessor { Field_accessor(f, e, Annotation.create $loc) }
    | LCUR e = expression_list RCUR { List(e, Annotation.create $loc) }
    | e1 = expression CONS e2 = expression { Cons(e1, e2, Annotation.create $loc) }
    
expression_list:
    | e = expression { [e] }
    | e1 = expression COMMA e2 = expression_list { e1 :: e2 } (* not empty -> pop the first *)    
    | { [] } (* empty expression list *)

field_accessor:
  | POINT DOT COLOR { Color_accessor }
  | POINT DOT POS { Position_accessor }
  | POS DOT X { X_accessor }
  | POS DOT Y { Y_accessor }
  | COLOR DOT BLUE { Blue_accessor }
  | COLOR DOT RED { Red_accessor }
  | COLOR DOT GREEN { Green_accessor }

unary_operator:
  | SUB { USub }
  | NOT { Not }
  | HEAD { Head }
  | TAIL { Tail }
  | FLOOR { Floor }
  | FLOAT_OF_INT { Float_of_int }
  | COS { Cos }
  | SIN { Sin }

binary_operator:
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
    | INT_TYP { Int }
    | FLOAT_TYP { Float }
    | BOOL_TYP { Bool }
    | POS { Pos }
    | COLOR { Color }
    | POINT { Point }
    | t = LIST { List(t) } (* A verifier *)