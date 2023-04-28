
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
%token NOT HEAD TAIL FLOOR FLOAT_OF_INT COS SIN 
%token COLOR POS X Y BLUE RED GREEN
%token PRINT COPY IF ELSE FOR FROM TO STEP FOREACH IN DRAW
%token CONS DOT COMMA SEMICOLON BEGIN END



%start <program> main

%%

main:
    | s = argument_list EOF { Program(s, Block([], Annotation.create $loc)) }

argument_list:
    | a1 = argument SEMICOLON a2 = argument_list { a1 :: a2 }
    | { [] } (* empty statements list *)

argument:

statements:
    | { [] } (* empty statements list *)
    | s1 = statement SEMICOLON s2 = statements { s1 :: s2 } (* not empty -> pop the first *)
  
statement:
    | e1 = expression e2 = expression { Assignment(e1, e2, Annotation.create $loc) }
(*  | declaration { Prog.Statement.Declaration(\$1) } 
    | control_structure { Prog.Statement.ControlStructure(\$1) }*)

expression:
    | e = constant_i { Constant_i(e, Annotation.create $loc) }

constant_i:
  | i = INT { i }
























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

