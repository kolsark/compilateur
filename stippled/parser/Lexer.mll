
{
    open Parser
    exception Error of string
}

let digit = ['0'-'9']
let alphanum = ['a'-'z' 'A'-'Z' '0'-'9' '\'' '_']

rule token = parse
    | "//" [^ '\n']* '\n' {Lexing.new_line lexbuf; token lexbuf}
    | "/*"              {commentary lexbuf}
    | [' ' '\t' '\r']   {token lexbuf}
    | '\n'              { Lexing.new_line lexbuf ; token lexbuf }
    |"And"          {AND}
    |"Begin"        {BEGIN}
    |"Blue"         {BLUE}
    |"Bool"         {BOOL} 
    |"true"         {BOOL_LITERAL(true)}
    |"false"        {BOOL_LITERAL(false)}
    |"Color"        {COLOR}
    |"Copy"         {COPY}
    |"Cos"          {COS}
    |"Draw"         {DRAW}
    |"Else"         {ELSE}
    |"End"          {END}
    (* |"Float"        {FLOAT} *)
    |"Float_of_int" {FLOAT_OF_INT}
    |"Floor"        {FLOOR}
    |"For"          {FOR}
    |"Foreach"      {FOREACH}
    |"From"         {FROM}
    |"Green"        {GREEN}
    |"Head"         {HEAD}
    |"If"           {IF}
    |"In"           {IN}
    (* |"Int"          {INT} *)
    |"List"         {LIST}
    |"Not"          {NOT}
    |"Or"           {OR}
    |"Point"        {POINT}
    |"Pos"          {POS}
    |"Print"        {PRINT}
    |"Red"          {RED}
    |"Sin"          {SIN}
    |"Step"         {STEP}
    |"Tail"         {TAIL}
    |"To"           {TO}
    |"X"            {X}
    |"Y"            {Y}
    |"+"            {ADD}
    |"-"            {SUB}
    |"*"            {MUL}
    |"/"            {DIV}
    |"%"            {MOD}
    |"="            {EQ}
    |"<>"           {NE}
    |"<="           {LE}
    |">="           {GE}
    |"<"            {LT}
    |">"            {GT}
    |"::"           {CONS}
    |"."            {DOT}
    |","            {COMMA}
    |";"            {SEMICOLON}

    | "\"" ([^ '\"']* as s) "\""  { STRING(s) }
    | (digit)* "." (digit)* as s {FLOAT(try float_of_string s with Failure _ -> raise (Error(s)) )}
    | (digit)+ as s     { INT(try int_of_string s with Failure _ ->(let pos = Lexing.lexeme_start_p lexbuf in raise (Error(Format.sprintf "Line %d, char %d ,Read: '%s'. It is not a valid integer" pos.pos_lnum (pos.pos_cnum - pos.pos_bol +1) s)) ))}
    | eof           {EOF}
    | ['a'-'z'] (alphanum)* as s  { ID(s) }
    | _ as s        {let pos = Lexing.lexeme_start_p lexbuf in raise (Error(Format.sprintf "Line %d, char %d ,Read: '%c'. It is not an acceptable character" pos.pos_lnum (pos.pos_cnum - pos.pos_bol +1) s))}

    and commentary = parse
    | '\n'          {Lexing.new_line lexbuf; commentary lexbuf}
    | "*/"          {token lexbuf}
    | _             {commentary lexbuf}