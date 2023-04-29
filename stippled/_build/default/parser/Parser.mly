
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
%token BOOL POINT LIST
%token ADD SUB MUL DIV MOD AND OR EQ NE LT GT LE GE
%token NOT USUB HEAD TAIL FLOOR FLOAT_OF_INT COS SIN 
%token COLOR POS X Y BLUE RED GREEN
%token PRINT COPY IF ELSE FOR FROM TO STEP FOREACH IN DRAW
%token CONS DOT COMMA SEMICOLON BEGIN END LPAR RPAR LCUR RCUR LSQ RSQ

%left AND OR
%left EQ NE LT GT LE GE
%left ADD SUB 
%left MUL DIV MOD
%nonassoc ELSE NOT



%start <program> main

%%

main:
    | s = program EOF { s }
    | EOF { Program([], Block([], Annotation.create $loc)) }

program:
    | a = argument_list s = statement { Program(a, s) }

argument_list:
    | a1 = argument SEMICOLON a2 = argument_list { a1 :: a2 } (* not empty -> pop the first *)
    | a = argument { [a] }
    | { [] } (* empty statements list *)

argument:
    | a1 = STRING a2 = type_expr { Argument(a1, a2, Annotation.create $loc) }
 
statement:
    | COPY e1 = expression e2 = expression SEMICOLON { Assignment(e1, e2, Annotation.create $loc) }
    | e = ID t = type_expr SEMICOLON { Variable_declaration(e, t, Annotation.create $loc)}


expression:
    | i = INT { Constant_i(i, Annotation.create $loc) }
    | f = FLOAT { Constant_f(f, Annotation.create $loc) }
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
  | COLOR { Color_accessor }
  | POS { Position_accessor }
  | X { X_accessor }
  | Y { Y_accessor }
  | BLUE { Blue_accessor }
  | RED { Red_accessor }
  | GREEN { Green_accessor }

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
    | INT { Type_int }
    | FLOAT { Type_float }
    | BOOL { Type_bool }
    | POS { Type_pos }
    | COLOR { Type_color }
    | POINT { Type_point }
    | e = type_expr LIST { Type_list(e) }

























(*    | FLOAT { Expression.Constant_f(\$1, Annotation.create $loc) }
    | BOOL { Expression.Constant_b(\$1, Annotation.create $loc) }
    | STRING { Expression.Variable(\$1, Annotation.create $loc) }
    | expression ADD expression { Expression.Binary_operator(Add, \$1, \$3, Annotation.create \$2) }
    | expression SUB expression { Expression.Binary_operator(Sub, \$1, \$3, Annotation.create \$2) }
    | expression MUL expression { Expression.Binary_operator(Mul, \$1, \$3, Annotation.create \$2) }
    | expression DIV expression { Expression.Binary_operator(Div, \$1, \$3, Annotation.create \$2) }
    | expression MOD expression { Expression.Binary_operator(Mod, \$1, \$3, Annotation.create \$2) }
    | expression EQ expression { Expression.Binary_operator(Eq, \$1, \$3, Annotation.create \$2) }
    | expression NE expression { Expression.Binary_operator(Ne, \$1, \$3, Annotation.create \$2) }
    | expression LT expression { Expression.Binary_operator(Lt, \$1, \$3, Annotation.create \$2) }
    | expression GT expression { Expression.Binary_operator(Gt, \$1, \$3, Annotation.create \$2) }
    | expression LE expression { Expression.Binary_operator(Le, \$1, \$3, Annotation.create \$2) }
    | expression GE expression { Expression.Binary_operator(Ge, \$1, \$3, Annotation.create \$2) }
    | expression AND expression { Expression.Binary_operator(And, \$1, \$3, Annotation.create \$2) }
    | expression OR expression { Expression.Binary_operator(Or, \$1, \$3, Annotation.create \$2) }
    | NOT expression { Expression.Unary_operator(Not, \$2, Annotation.create \$1.loc) }

declaration: 
    | INT ID { Statement.Variable_declaration(\$2, Type_int, Annotation.create \$1.loc) }
    | FLOAT ID { Statement.Variable_declaration(\$2, Type_float, Annotation.create \$1.loc) }
    | BOOL ID { Statement.Variable_declaration(\$2, Type_bool, Annotation.create \$1.loc) }
    | POINT ID { Statement.Variable_declaration(\$2, Type_point, Annotation.create \$1.loc) }
    | COLOR ID { Statement.Variable_declaration(\$2, Type_color, Annotation.create \$1.loc) }
    | LIST ID { Statement.Variable_declaration(\$2, Type_list, Annotation.create \$1.loc) }

control_structure: 
    | IF expression THEN statement ELSE statement END { Statement.IfThenElse(\$2, \$4, \$6, Annotation.create \$1.loc) }
    | FOR ID IN expression TO expression DO statement END { Statement.For(\$2, \$4, \$6, \$8, Annotation.create \$1.loc) } 
    | FOREACH ID IN expression DO statement END { Statement.Foreach(\$2, \$4, \$6, Annotation.create \$1.loc) } 
    | WHILE expression DO statement END { Statement.While(\$2, \$4, Annotation.create \$1.loc) } 
    | BEGIN statements END { Statement.Block(\$2, Annotation.create \$1.loc) } *)

