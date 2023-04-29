
(* This generated code requires the following version of MenhirLib: *)

let () =
  MenhirLib.StaticVersion.require_20230415

module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | Y
    | X
    | USUB
    | TO
    | TAIL
    | SUB
    | STRING of (
# 13 "parser/Parser.mly"
       (string)
# 26 "parser/Parser.ml"
  )
    | STEP
    | SIN
    | SEMICOLON
    | RSQ
    | RPAR
    | RED
    | RCUR
    | PRINT
    | POS
    | POINT
    | OR
    | NOT
    | NE
    | MUL
    | MOD
    | LT
    | LSQ
    | LPAR
    | LIST
    | LE
    | LCUR
    | INT of (
# 15 "parser/Parser.mly"
       (int)
# 52 "parser/Parser.ml"
  )
    | IN
    | IF
    | ID of (
# 16 "parser/Parser.mly"
       (string)
# 59 "parser/Parser.ml"
  )
    | HEAD
    | GT
    | GREEN
    | GE
    | FROM
    | FOREACH
    | FOR
    | FLOOR
    | FLOAT_OF_INT
    | FLOAT of (
# 14 "parser/Parser.mly"
       (float)
# 73 "parser/Parser.ml"
  )
    | EQ
    | EOF
    | END
    | ELSE
    | DRAW
    | DOT
    | DIV
    | COS
    | COPY
    | CONS
    | COMMA
    | COLOR
    | BOOL_LITERAL of (
# 12 "parser/Parser.mly"
       (bool)
# 90 "parser/Parser.ml"
  )
    | BOOL
    | BLUE
    | BEGIN
    | AND
    | ADD
  
end

include MenhirBasics

# 2 "parser/Parser.mly"
  
  open Ast

  (*Le parseur doit générer des Ast.program.
    Pour les annotation, il vous suffit de créer l’annotation avec [Annotation.create $loc] qui sera ce qu’il vous faut dans tous les cas :
    $loc est un paramètre qui correspond aux positions délimitant la chaîne de caractères parsée par la règle où il est utilisé,
    ce qui est exactement ce qu’il faut mettre dans l’annotation.*)

# 111 "parser/Parser.ml"

module Tables = struct
  
  include MenhirBasics
  
  let token2terminal : token -> int =
    fun _tok ->
      match _tok with
      | ADD ->
          60
      | AND ->
          59
      | BEGIN ->
          58
      | BLUE ->
          57
      | BOOL ->
          56
      | BOOL_LITERAL _ ->
          55
      | COLOR ->
          54
      | COMMA ->
          53
      | CONS ->
          52
      | COPY ->
          51
      | COS ->
          50
      | DIV ->
          49
      | DOT ->
          48
      | DRAW ->
          47
      | ELSE ->
          46
      | END ->
          45
      | EOF ->
          44
      | EQ ->
          43
      | FLOAT _ ->
          42
      | FLOAT_OF_INT ->
          41
      | FLOOR ->
          40
      | FOR ->
          39
      | FOREACH ->
          38
      | FROM ->
          37
      | GE ->
          36
      | GREEN ->
          35
      | GT ->
          34
      | HEAD ->
          33
      | ID _ ->
          32
      | IF ->
          31
      | IN ->
          30
      | INT _ ->
          29
      | LCUR ->
          28
      | LE ->
          27
      | LIST ->
          26
      | LPAR ->
          25
      | LSQ ->
          24
      | LT ->
          23
      | MOD ->
          22
      | MUL ->
          21
      | NE ->
          20
      | NOT ->
          19
      | OR ->
          18
      | POINT ->
          17
      | POS ->
          16
      | PRINT ->
          15
      | RCUR ->
          14
      | RED ->
          13
      | RPAR ->
          12
      | RSQ ->
          11
      | SEMICOLON ->
          10
      | SIN ->
          9
      | STEP ->
          8
      | STRING _ ->
          7
      | SUB ->
          6
      | TAIL ->
          5
      | TO ->
          4
      | USUB ->
          3
      | X ->
          2
      | Y ->
          1
  
  and error_terminal =
    0
  
  and token2value : token -> Obj.t =
    fun _tok ->
      match _tok with
      | ADD ->
          Obj.repr ()
      | AND ->
          Obj.repr ()
      | BEGIN ->
          Obj.repr ()
      | BLUE ->
          Obj.repr ()
      | BOOL ->
          Obj.repr ()
      | BOOL_LITERAL _v ->
          Obj.repr _v
      | COLOR ->
          Obj.repr ()
      | COMMA ->
          Obj.repr ()
      | CONS ->
          Obj.repr ()
      | COPY ->
          Obj.repr ()
      | COS ->
          Obj.repr ()
      | DIV ->
          Obj.repr ()
      | DOT ->
          Obj.repr ()
      | DRAW ->
          Obj.repr ()
      | ELSE ->
          Obj.repr ()
      | END ->
          Obj.repr ()
      | EOF ->
          Obj.repr ()
      | EQ ->
          Obj.repr ()
      | FLOAT _v ->
          Obj.repr _v
      | FLOAT_OF_INT ->
          Obj.repr ()
      | FLOOR ->
          Obj.repr ()
      | FOR ->
          Obj.repr ()
      | FOREACH ->
          Obj.repr ()
      | FROM ->
          Obj.repr ()
      | GE ->
          Obj.repr ()
      | GREEN ->
          Obj.repr ()
      | GT ->
          Obj.repr ()
      | HEAD ->
          Obj.repr ()
      | ID _v ->
          Obj.repr _v
      | IF ->
          Obj.repr ()
      | IN ->
          Obj.repr ()
      | INT _v ->
          Obj.repr _v
      | LCUR ->
          Obj.repr ()
      | LE ->
          Obj.repr ()
      | LIST ->
          Obj.repr ()
      | LPAR ->
          Obj.repr ()
      | LSQ ->
          Obj.repr ()
      | LT ->
          Obj.repr ()
      | MOD ->
          Obj.repr ()
      | MUL ->
          Obj.repr ()
      | NE ->
          Obj.repr ()
      | NOT ->
          Obj.repr ()
      | OR ->
          Obj.repr ()
      | POINT ->
          Obj.repr ()
      | POS ->
          Obj.repr ()
      | PRINT ->
          Obj.repr ()
      | RCUR ->
          Obj.repr ()
      | RED ->
          Obj.repr ()
      | RPAR ->
          Obj.repr ()
      | RSQ ->
          Obj.repr ()
      | SEMICOLON ->
          Obj.repr ()
      | SIN ->
          Obj.repr ()
      | STEP ->
          Obj.repr ()
      | STRING _v ->
          Obj.repr _v
      | SUB ->
          Obj.repr ()
      | TAIL ->
          Obj.repr ()
      | TO ->
          Obj.repr ()
      | USUB ->
          Obj.repr ()
      | X ->
          Obj.repr ()
      | Y ->
          Obj.repr ()
  
  and default_reduction =
    (8, "\000\00013./20\0004*\000)\001\000\000\000-\00085<\000\000\000\0006\000\019\02579:\020;\000\000\021\000\000\007\012\014\b\n\015\017\016\018\r\000%$'#(\"&\028\t\000\000\011\006\000\000\000\000\000\000\000\023\000\029\000\000 \000\000\000\024\000\000\000\022\0005\000,+\000\000\003")
  
  and error =
    (61, "\001\000\000\000\128\b\016\000\000\006\000 \001\000\020\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \000 \128\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000@\000\000\024\000\128\004\000P\000 \000 \000\000\000\000\000\000\000\000\000\000\000\001\1444\00308\b\192\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\200\026\001\152\028\004`\000\000\000@\000\000\000\0002\006\128f\007\001\024\000\000\000\000\000\000\000\000\012\133\160\025\129\192F\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000d\r\000\204\014\0020\000\000\000\000\000\000\000\000\025\003@3\003\128\140\000\205_\227\157\030\029\227\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\024\001 \000\004\000\000\144\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000d\r\000\204\014\0020\0035\127\142txw\140\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\006@\208\012\192\224#\0003W\248\231G\135x\192\128\011\196\n\0043\006\012\129\160\025\129\192F\000 \002\241\002\129\012\193\131 h\006`p\017\128\b \188@\160C `\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128\139\196\n\0043\006\012\133\160\025\129\192F\000\000\000\000\000\000\000\000\001\000\023\136\020\bf\012\025\003@3\003\128\140\000A\005\226\005\002\025\003\000\000\000\000\000\000\000\000\016\001x\129@\134`\193\1444\00308\b\192\004\016^ P!\1440\000\000\000\000\000\000\000\003 \127\142txu\140\000\000\000\000\000\000\000\000D\005\226\005\002\025\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000 \000\004\000\002\000\000\001\000\000 \000\000\000\000\000\000\000\000\000")
  
  and start =
    1
  
  and action =
    ((16, "\001\006\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000U\000\000\000\000\0005\000\b\000\015\000\000\001\150\000\000\000\000\000\000\000#\001\150\000\n\001\150\000\000\001\150\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\018\001\150\000\000\001\150\000\011\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\168\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\150\000^\000\000\000\000\001\150\000\198\002 \001\150\002x\001\150\001\200\000\000\0002\000\000\001\200\001\150\000\000\002\208\001\150\002 \000\000\003(\001\150\002x\000\000\001.\000\000\001\200\000\000\000\000\000h\000\156\000\000"), (16, "\000i\000\162\0003\000F\000i\000i\000>\000i\000^\000i\000\005\000i\000i\000\166\000i\000\170\000\174\000\178\000\182\000&\000\n\000\014\000\186\000i\000i\000J\000&\000i\000i\000\190\000f\000\194\000\005\000\018\000\146\000i\000i\000i\000\198\001&\000\000\000\000\000\000\000\202\000\238\000i\000\022\000\242\000i\000i\000i\000\005\000u\000\162\000\250\000\254\000u\000u\000\026\000u\000\030\000u\001n\000u\000u\000\166\000u\000\170\000\174\000\178\000\182\000\000\000\000\000\000\000\186\000u\000u\000\000\000\000\000u\000u\000\190\000\000\000\194\000\r\000\006\000\000\000u\000u\000u\000\198\000\000\000\000\000\000\000\000\000\202\000\238\000u\000\000\000\242\000u\000u\000u\000\r\000e\000\162\000\250\000\254\000e\000e\000\017\000e\000\000\000e\000\000\000e\000e\000\166\000e\000\170\000\174\000\178\000\182\000\000\000\000\000\000\000\186\000e\000e\000\017\000\000\000e\000e\000\190\000\000\000\194\000\000\000\000\000\006\000e\000e\000e\000\198\000\000\000\000\000\000\000\000\000\202\000\238\000e\000\000\000\242\000e\000e\000e\000\000\000N\001Z\000\250\000\254\000V\000\000\000\000\000\017\000\000\000\000\000\000\000Z\000b\000\166\000j\000\170\000\174\000\178\000\182\000+\000\000\000\000\000\186\000n\000r\000\000\000\017\000v\000z\000\190\000\000\000\194\000\000\000\000\000\000\000~\000\130\000\134\000\198\000\000\000\000\000\000\000\000\000\202\000\238\000\138\000\000\000\242\000\000\000\142\000\150\000\000\000N\000R\000\250\000\254\000V\000\206\000\210\000\000\000\000\000\129\000\000\000Z\000b\000\000\000j\000\000\000\000\000\214\000\000\000\000\000\218\000\000\000\000\000n\000r\000\000\000\162\000v\000z\000\000\001b\000\000\001\030\000\000\000y\000~\000\130\000\134\000\166\000\222\000\170\000\174\000\178\000\182\000\000\000\138\000\000\000\186\000\000\000\142\000\150\000\000\000\000\000\000\000\190\000\000\000\194\000\000\000\226\000\000\000\000\000\230\000\000\000\198\000\000\000\000\000\000\000\000\000\202\000\238\000\162\000\000\000\242\001.\000\000\000\000\001B\000\000\000\000\000\250\000\254\000\000\000\166\000\000\000\170\000\174\000\178\000\182\000\000\000\000\000\000\000\186\000\000\000\000\000\000\000\000\000\000\000\000\000\190\000\000\000\194\000\000\000\000\000\000\000\000\000\000\000\000\000\198\000\000\000\000\000\000\000\000\000\202\000\238\000\162\000\000\000\242\001\014\000\000\000\000\001R\000\000\000\000\000\250\000\254\000\000\000\166\000\000\000\170\000\174\000\178\000\182\000\000\000\000\000\000\000\186\000\000\000\000\000\000\000\000\000\000\000\000\000\190\000\000\000\194\000\000\000\000\000\000\000\000\000\000\000\000\000\198\000\000\000\000\000\000\000\000\000\202\000\238\000\162\000\000\000\242\001\022\000\000\000\000\000\000\000\000\000\000\000\250\000\254\000\000\000\166\000\000\000\170\000\174\000\178\000\182\000\000\000\000\000\000\000\186\000\000\000\000\000\000\000\000\000\000\000\000\000\190\000\000\000\194\000\000\000\000\000\000\000\000\000\000\000\000\000\198\000\000\000\000\000\000\000\000\000\202\000\238\000\162\000\000\000\242\001:\000\000\000\000\000\000\000\000\000\000\000\250\000\254\000\000\000\166\000\000\000\170\000\174\000\178\000\182\000\000\000\000\000\000\000\186\000\000\000\000\000\000\000\000\000\000\000\000\000\190\000\000\000\194\000\000\000\000\000\000\000\000\000\000\000\000\000\198\000\000\000\000\000\000\000\000\000\202\000\238\000\000\000\000\000\242\001J\000\000\000\000\000\000\000\000\000\000\000\250\000\254"))
  
  and lhs =
    (4, "\011\170\169\153\153\153\153\153\153\136\136\136\136\136\136wvfffUC2\"\"\"\017\017\017\017")
  
  and goto =
    ((8, "\t\002\000\000\000\000\000\000\000\000\000\000\000\000>J\000\000\026\000\000\000\000\028\000\030\000\002\000\000\000\000\000\000\000\000 \000\"\b\000\000\000\000\000\000\000\000\000\000D\000\000\000\000\000\000\000\000\000$\b\000\000&\b\b6\b8\b\000\000\000\b\006\000\b:\b\000\b<\b\000\b\000\b\000\000\000,\000"), (8, "\012\014'\t''\015[IKMKXA'''''''VRNC(>B''''][ZEGPT\017;"))
  
  and semantic_action =
    [|
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = a2;
          MenhirLib.EngineTypes.startp = _startpos_a2_;
          MenhirLib.EngineTypes.endp = _endpos_a2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = a1;
            MenhirLib.EngineTypes.startp = _startpos_a1_;
            MenhirLib.EngineTypes.endp = _endpos_a1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let a2 : (Ast.type_expr) = Obj.magic a2 in
        let a1 : (
# 13 "parser/Parser.mly"
       (string)
# 407 "parser/Parser.ml"
        ) = Obj.magic a1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_a1_ in
        let _endpos = _endpos_a2_ in
        let _v =
          let _endpos = _endpos_a2_ in
          let _startpos = _startpos_a1_ in
          let _loc = (_startpos, _endpos) in
          (
# 49 "parser/Parser.mly"
                                 ( Argument(a1, a2, Annotation.create _loc) )
# 419 "parser/Parser.ml"
           : (Ast.argument))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = a2;
          MenhirLib.EngineTypes.startp = _startpos_a2_;
          MenhirLib.EngineTypes.endp = _endpos_a2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = a1;
              MenhirLib.EngineTypes.startp = _startpos_a1_;
              MenhirLib.EngineTypes.endp = _endpos_a1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let a2 : (Ast.argument list) = Obj.magic a2 in
        let _2 : unit = Obj.magic _2 in
        let a1 : (Ast.argument) = Obj.magic a1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_a1_ in
        let _endpos = _endpos_a2_ in
        let _v : (Ast.argument list) = 
# 44 "parser/Parser.mly"
                                                 ( a1 :: a2 )
# 459 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = a;
          MenhirLib.EngineTypes.startp = _startpos_a_;
          MenhirLib.EngineTypes.endp = _endpos_a_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let a : (Ast.argument) = Obj.magic a in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_a_ in
        let _endpos = _endpos_a_ in
        let _v : (Ast.argument list) = 
# 45 "parser/Parser.mly"
                   ( [a] )
# 484 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Ast.argument list) = 
# 46 "parser/Parser.mly"
      ( [] )
# 502 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.binary_operator) = 
# 95 "parser/Parser.mly"
          ( Add )
# 527 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.binary_operator) = 
# 96 "parser/Parser.mly"
          ( Sub )
# 552 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.binary_operator) = 
# 97 "parser/Parser.mly"
          ( Mul )
# 577 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.binary_operator) = 
# 98 "parser/Parser.mly"
          ( Div )
# 602 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.binary_operator) = 
# 99 "parser/Parser.mly"
          ( Mod )
# 627 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.binary_operator) = 
# 100 "parser/Parser.mly"
          ( And )
# 652 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.binary_operator) = 
# 101 "parser/Parser.mly"
         ( Or )
# 677 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.binary_operator) = 
# 102 "parser/Parser.mly"
         ( Eq )
# 702 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.binary_operator) = 
# 103 "parser/Parser.mly"
         ( Ne )
# 727 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.binary_operator) = 
# 104 "parser/Parser.mly"
         ( Lt )
# 752 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.binary_operator) = 
# 105 "parser/Parser.mly"
         ( Gt )
# 777 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.binary_operator) = 
# 106 "parser/Parser.mly"
         ( Le )
# 802 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.binary_operator) = 
# 107 "parser/Parser.mly"
         ( Ge )
# 827 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = i;
          MenhirLib.EngineTypes.startp = _startpos_i_;
          MenhirLib.EngineTypes.endp = _endpos_i_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let i : (
# 15 "parser/Parser.mly"
       (int)
# 848 "parser/Parser.ml"
        ) = Obj.magic i in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_i_ in
        let _endpos = _endpos_i_ in
        let _v =
          let _endpos = _endpos_i_ in
          let _startpos = _startpos_i_ in
          let _loc = (_startpos, _endpos) in
          (
# 57 "parser/Parser.mly"
              ( Constant_i(i, Annotation.create _loc) )
# 860 "parser/Parser.ml"
           : (Ast.expression))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = f;
          MenhirLib.EngineTypes.startp = _startpos_f_;
          MenhirLib.EngineTypes.endp = _endpos_f_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let f : (
# 14 "parser/Parser.mly"
       (float)
# 882 "parser/Parser.ml"
        ) = Obj.magic f in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_f_ in
        let _endpos = _endpos_f_ in
        let _v =
          let _endpos = _endpos_f_ in
          let _startpos = _startpos_f_ in
          let _loc = (_startpos, _endpos) in
          (
# 58 "parser/Parser.mly"
                ( Constant_f(f, Annotation.create _loc) )
# 894 "parser/Parser.ml"
           : (Ast.expression))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = b;
          MenhirLib.EngineTypes.startp = _startpos_b_;
          MenhirLib.EngineTypes.endp = _endpos_b_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let b : (
# 12 "parser/Parser.mly"
       (bool)
# 916 "parser/Parser.ml"
        ) = Obj.magic b in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_b_ in
        let _endpos = _endpos_b_ in
        let _v =
          let _endpos = _endpos_b_ in
          let _startpos = _startpos_b_ in
          let _loc = (_startpos, _endpos) in
          (
# 59 "parser/Parser.mly"
                       ( Constant_b(b, Annotation.create _loc) )
# 928 "parser/Parser.ml"
           : (Ast.expression))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _6;
          MenhirLib.EngineTypes.startp = _startpos__6_;
          MenhirLib.EngineTypes.endp = _endpos__6_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = e2;
            MenhirLib.EngineTypes.startp = _startpos_e2_;
            MenhirLib.EngineTypes.endp = _endpos_e2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _4;
              MenhirLib.EngineTypes.startp = _startpos__4_;
              MenhirLib.EngineTypes.endp = _endpos__4_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _2;
                  MenhirLib.EngineTypes.startp = _startpos__2_;
                  MenhirLib.EngineTypes.endp = _endpos__2_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _menhir_s;
                    MenhirLib.EngineTypes.semv = _1;
                    MenhirLib.EngineTypes.startp = _startpos__1_;
                    MenhirLib.EngineTypes.endp = _endpos__1_;
                    MenhirLib.EngineTypes.next = _menhir_stack;
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _6 : unit = Obj.magic _6 in
        let e2 : (Ast.expression) = Obj.magic e2 in
        let _4 : unit = Obj.magic _4 in
        let e1 : (Ast.expression) = Obj.magic e1 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v =
          let _endpos = _endpos__6_ in
          let _startpos = _startpos__1_ in
          let _loc = (_startpos, _endpos) in
          (
# 60 "parser/Parser.mly"
                                                          ( Pos(e1, e2, Annotation.create _loc) )
# 993 "parser/Parser.ml"
           : (Ast.expression))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _8;
          MenhirLib.EngineTypes.startp = _startpos__8_;
          MenhirLib.EngineTypes.endp = _endpos__8_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = e3;
            MenhirLib.EngineTypes.startp = _startpos_e3_;
            MenhirLib.EngineTypes.endp = _endpos_e3_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _6;
              MenhirLib.EngineTypes.startp = _startpos__6_;
              MenhirLib.EngineTypes.endp = _endpos__6_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = e2;
                MenhirLib.EngineTypes.startp = _startpos_e2_;
                MenhirLib.EngineTypes.endp = _endpos_e2_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _4;
                  MenhirLib.EngineTypes.startp = _startpos__4_;
                  MenhirLib.EngineTypes.endp = _endpos__4_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = e1;
                    MenhirLib.EngineTypes.startp = _startpos_e1_;
                    MenhirLib.EngineTypes.endp = _endpos_e1_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = _2;
                      MenhirLib.EngineTypes.startp = _startpos__2_;
                      MenhirLib.EngineTypes.endp = _endpos__2_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _menhir_s;
                        MenhirLib.EngineTypes.semv = _1;
                        MenhirLib.EngineTypes.startp = _startpos__1_;
                        MenhirLib.EngineTypes.endp = _endpos__1_;
                        MenhirLib.EngineTypes.next = _menhir_stack;
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _8 : unit = Obj.magic _8 in
        let e3 : (Ast.expression) = Obj.magic e3 in
        let _6 : unit = Obj.magic _6 in
        let e2 : (Ast.expression) = Obj.magic e2 in
        let _4 : unit = Obj.magic _4 in
        let e1 : (Ast.expression) = Obj.magic e1 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__8_ in
        let _v =
          let _endpos = _endpos__8_ in
          let _startpos = _startpos__1_ in
          let _loc = (_startpos, _endpos) in
          (
# 61 "parser/Parser.mly"
                                                                                  ( Color(e1, e2, e3, Annotation.create _loc) )
# 1072 "parser/Parser.ml"
           : (Ast.expression))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _6;
          MenhirLib.EngineTypes.startp = _startpos__6_;
          MenhirLib.EngineTypes.endp = _endpos__6_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = e2;
            MenhirLib.EngineTypes.startp = _startpos_e2_;
            MenhirLib.EngineTypes.endp = _endpos_e2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _4;
              MenhirLib.EngineTypes.startp = _startpos__4_;
              MenhirLib.EngineTypes.endp = _endpos__4_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _2;
                  MenhirLib.EngineTypes.startp = _startpos__2_;
                  MenhirLib.EngineTypes.endp = _endpos__2_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _menhir_s;
                    MenhirLib.EngineTypes.semv = _1;
                    MenhirLib.EngineTypes.startp = _startpos__1_;
                    MenhirLib.EngineTypes.endp = _endpos__1_;
                    MenhirLib.EngineTypes.next = _menhir_stack;
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _6 : unit = Obj.magic _6 in
        let e2 : (Ast.expression) = Obj.magic e2 in
        let _4 : unit = Obj.magic _4 in
        let e1 : (Ast.expression) = Obj.magic e1 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v =
          let _endpos = _endpos__6_ in
          let _startpos = _startpos__1_ in
          let _loc = (_startpos, _endpos) in
          (
# 62 "parser/Parser.mly"
                                                            ( Point(e1, e2, Annotation.create _loc) )
# 1137 "parser/Parser.ml"
           : (Ast.expression))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = e1;
          MenhirLib.EngineTypes.startp = _startpos_e1_;
          MenhirLib.EngineTypes.endp = _endpos_e1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let e1 : (
# 16 "parser/Parser.mly"
       (string)
# 1159 "parser/Parser.ml"
        ) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e1_ in
        let _v =
          let _endpos = _endpos_e1_ in
          let _startpos = _startpos_e1_ in
          let _loc = (_startpos, _endpos) in
          (
# 63 "parser/Parser.mly"
              ( Variable(e1, Annotation.create _loc) )
# 1171 "parser/Parser.ml"
           : (Ast.expression))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e3;
          MenhirLib.EngineTypes.startp = _startpos_e3_;
          MenhirLib.EngineTypes.endp = _endpos_e3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = e2;
            MenhirLib.EngineTypes.startp = _startpos_e2_;
            MenhirLib.EngineTypes.endp = _endpos_e2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e3 : (Ast.expression) = Obj.magic e3 in
        let e2 : (Ast.binary_operator) = Obj.magic e2 in
        let e1 : (Ast.expression) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e3_ in
        let _v =
          let _endpos = _endpos_e3_ in
          let _startpos = _startpos_e1_ in
          let _loc = (_startpos, _endpos) in
          (
# 64 "parser/Parser.mly"
                                                           ( Binary_operator(e2, e1, e3, Annotation.create _loc) )
# 1215 "parser/Parser.ml"
           : (Ast.expression))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = e1;
            MenhirLib.EngineTypes.startp = _startpos_e1_;
            MenhirLib.EngineTypes.endp = _endpos_e1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let e2 : (Ast.expression) = Obj.magic e2 in
        let e1 : (Ast.unary_operator) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let _endpos = _endpos_e2_ in
          let _startpos = _startpos_e1_ in
          let _loc = (_startpos, _endpos) in
          (
# 65 "parser/Parser.mly"
                                          ( Unary_operator(e1, e2, Annotation.create _loc) )
# 1252 "parser/Parser.ml"
           : (Ast.expression))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = f;
          MenhirLib.EngineTypes.startp = _startpos_f_;
          MenhirLib.EngineTypes.endp = _endpos_f_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e;
              MenhirLib.EngineTypes.startp = _startpos_e_;
              MenhirLib.EngineTypes.endp = _endpos_e_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let f : (Ast.field_accessor) = Obj.magic f in
        let _2 : unit = Obj.magic _2 in
        let e : (Ast.expression) = Obj.magic e in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e_ in
        let _endpos = _endpos_f_ in
        let _v =
          let _endpos = _endpos_f_ in
          let _startpos = _startpos_e_ in
          let _loc = (_startpos, _endpos) in
          (
# 66 "parser/Parser.mly"
                                            ( Field_accessor(f, e, Annotation.create _loc) )
# 1296 "parser/Parser.ml"
           : (Ast.expression))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = e;
            MenhirLib.EngineTypes.startp = _startpos_e_;
            MenhirLib.EngineTypes.endp = _endpos_e_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let e : (Ast.expression list) = Obj.magic e in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v =
          let _endpos = _endpos__3_ in
          let _startpos = _startpos__1_ in
          let _loc = (_startpos, _endpos) in
          (
# 67 "parser/Parser.mly"
                                    ( List(e, Annotation.create _loc) )
# 1340 "parser/Parser.ml"
           : (Ast.expression))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Ast.expression) = Obj.magic e2 in
        let _2 : unit = Obj.magic _2 in
        let e1 : (Ast.expression) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let _endpos = _endpos_e2_ in
          let _startpos = _startpos_e1_ in
          let _loc = (_startpos, _endpos) in
          (
# 68 "parser/Parser.mly"
                                           ( Cons(e1, e2, Annotation.create _loc) )
# 1384 "parser/Parser.ml"
           : (Ast.expression))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = e;
          MenhirLib.EngineTypes.startp = _startpos_e_;
          MenhirLib.EngineTypes.endp = _endpos_e_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let e : (Ast.expression) = Obj.magic e in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e_ in
        let _endpos = _endpos_e_ in
        let _v : (Ast.expression list) = 
# 71 "parser/Parser.mly"
                     ( [e] )
# 1410 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Ast.expression list) = Obj.magic e2 in
        let _2 : unit = Obj.magic _2 in
        let e1 : (Ast.expression) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (Ast.expression list) = 
# 72 "parser/Parser.mly"
                                                 ( e1 :: e2 )
# 1449 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Ast.expression list) = 
# 73 "parser/Parser.mly"
      ( [] )
# 1467 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.field_accessor) = 
# 76 "parser/Parser.mly"
          ( Color_accessor )
# 1492 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.field_accessor) = 
# 77 "parser/Parser.mly"
        ( Position_accessor )
# 1517 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.field_accessor) = 
# 78 "parser/Parser.mly"
      ( X_accessor )
# 1542 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.field_accessor) = 
# 79 "parser/Parser.mly"
      ( Y_accessor )
# 1567 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.field_accessor) = 
# 80 "parser/Parser.mly"
         ( Blue_accessor )
# 1592 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.field_accessor) = 
# 81 "parser/Parser.mly"
        ( Red_accessor )
# 1617 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.field_accessor) = 
# 82 "parser/Parser.mly"
          ( Green_accessor )
# 1642 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = s;
            MenhirLib.EngineTypes.startp = _startpos_s_;
            MenhirLib.EngineTypes.endp = _endpos_s_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let s : (Ast.program) = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos__2_ in
        let _v : (Ast.program) = 
# 37 "parser/Parser.mly"
                      ( s )
# 1674 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v =
          let _endpos = _endpos__1_ in
          let _startpos = _startpos__1_ in
          let _loc = (_startpos, _endpos) in
          (
# 38 "parser/Parser.mly"
          ( Program([], Block([], Annotation.create _loc)) )
# 1703 "parser/Parser.ml"
           : (Ast.program))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = a;
            MenhirLib.EngineTypes.startp = _startpos_a_;
            MenhirLib.EngineTypes.endp = _endpos_a_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let s : (Ast.statement) = Obj.magic s in
        let a : (Ast.argument list) = Obj.magic a in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_a_ in
        let _endpos = _endpos_s_ in
        let _v : (Ast.program) = 
# 41 "parser/Parser.mly"
                                      ( Program(a, s) )
# 1736 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = e2;
            MenhirLib.EngineTypes.startp = _startpos_e2_;
            MenhirLib.EngineTypes.endp = _endpos_e2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let e2 : (Ast.expression) = Obj.magic e2 in
        let e1 : (Ast.expression) = Obj.magic e1 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v =
          let _endpos = _endpos__4_ in
          let _startpos = _startpos__1_ in
          let _loc = (_startpos, _endpos) in
          (
# 52 "parser/Parser.mly"
                                                     ( Assignment(e1, e2, Annotation.create _loc) )
# 1786 "parser/Parser.ml"
           : (Ast.statement))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = t;
            MenhirLib.EngineTypes.startp = _startpos_t_;
            MenhirLib.EngineTypes.endp = _endpos_t_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e;
              MenhirLib.EngineTypes.startp = _startpos_e_;
              MenhirLib.EngineTypes.endp = _endpos_e_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let t : (Ast.type_expr) = Obj.magic t in
        let e : (
# 16 "parser/Parser.mly"
       (string)
# 1822 "parser/Parser.ml"
        ) = Obj.magic e in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e_ in
        let _endpos = _endpos__3_ in
        let _v =
          let _endpos = _endpos__3_ in
          let _startpos = _startpos_e_ in
          let _loc = (_startpos, _endpos) in
          (
# 53 "parser/Parser.mly"
                                     ( Variable_declaration(e, t, Annotation.create _loc))
# 1834 "parser/Parser.ml"
           : (Ast.statement))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : (
# 15 "parser/Parser.mly"
       (int)
# 1856 "parser/Parser.ml"
        ) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.type_expr) = 
# 110 "parser/Parser.mly"
          ( Type_int )
# 1864 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : (
# 14 "parser/Parser.mly"
       (float)
# 1885 "parser/Parser.ml"
        ) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.type_expr) = 
# 111 "parser/Parser.mly"
            ( Type_float )
# 1893 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.type_expr) = 
# 112 "parser/Parser.mly"
           ( Type_bool )
# 1918 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.type_expr) = 
# 113 "parser/Parser.mly"
          ( Type_pos )
# 1943 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.type_expr) = 
# 114 "parser/Parser.mly"
            ( Type_color )
# 1968 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.type_expr) = 
# 115 "parser/Parser.mly"
            ( Type_point )
# 1993 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = e;
            MenhirLib.EngineTypes.startp = _startpos_e_;
            MenhirLib.EngineTypes.endp = _endpos_e_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let e : (Ast.type_expr) = Obj.magic e in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e_ in
        let _endpos = _endpos__2_ in
        let _v : (Ast.type_expr) = 
# 116 "parser/Parser.mly"
                         ( Type_list(e) )
# 2025 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.unary_operator) = 
# 85 "parser/Parser.mly"
        ( USub )
# 2050 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.unary_operator) = 
# 86 "parser/Parser.mly"
        ( Not )
# 2075 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.unary_operator) = 
# 87 "parser/Parser.mly"
         ( Head )
# 2100 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.unary_operator) = 
# 88 "parser/Parser.mly"
         ( Tail )
# 2125 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.unary_operator) = 
# 89 "parser/Parser.mly"
          ( Floor )
# 2150 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.unary_operator) = 
# 90 "parser/Parser.mly"
                 ( Float_of_int )
# 2175 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.unary_operator) = 
# 91 "parser/Parser.mly"
        ( Cos )
# 2200 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.unary_operator) = 
# 92 "parser/Parser.mly"
        ( Sin )
# 2225 "parser/Parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
    |]
  
  and trace =
    None
  
end

module MenhirInterpreter = struct
  
  module ET = MenhirLib.TableInterpreter.MakeEngineTable (Tables)
  
  module TI = MenhirLib.Engine.Make (ET)
  
  include TI
  
  module Symbols = struct
    
    type _ terminal = 
      | T_error : unit terminal
      | T_Y : unit terminal
      | T_X : unit terminal
      | T_USUB : unit terminal
      | T_TO : unit terminal
      | T_TAIL : unit terminal
      | T_SUB : unit terminal
      | T_STRING : (
# 13 "parser/Parser.mly"
       (string)
# 2262 "parser/Parser.ml"
    ) terminal
      | T_STEP : unit terminal
      | T_SIN : unit terminal
      | T_SEMICOLON : unit terminal
      | T_RSQ : unit terminal
      | T_RPAR : unit terminal
      | T_RED : unit terminal
      | T_RCUR : unit terminal
      | T_PRINT : unit terminal
      | T_POS : unit terminal
      | T_POINT : unit terminal
      | T_OR : unit terminal
      | T_NOT : unit terminal
      | T_NE : unit terminal
      | T_MUL : unit terminal
      | T_MOD : unit terminal
      | T_LT : unit terminal
      | T_LSQ : unit terminal
      | T_LPAR : unit terminal
      | T_LIST : unit terminal
      | T_LE : unit terminal
      | T_LCUR : unit terminal
      | T_INT : (
# 15 "parser/Parser.mly"
       (int)
# 2288 "parser/Parser.ml"
    ) terminal
      | T_IN : unit terminal
      | T_IF : unit terminal
      | T_ID : (
# 16 "parser/Parser.mly"
       (string)
# 2295 "parser/Parser.ml"
    ) terminal
      | T_HEAD : unit terminal
      | T_GT : unit terminal
      | T_GREEN : unit terminal
      | T_GE : unit terminal
      | T_FROM : unit terminal
      | T_FOREACH : unit terminal
      | T_FOR : unit terminal
      | T_FLOOR : unit terminal
      | T_FLOAT_OF_INT : unit terminal
      | T_FLOAT : (
# 14 "parser/Parser.mly"
       (float)
# 2309 "parser/Parser.ml"
    ) terminal
      | T_EQ : unit terminal
      | T_EOF : unit terminal
      | T_END : unit terminal
      | T_ELSE : unit terminal
      | T_DRAW : unit terminal
      | T_DOT : unit terminal
      | T_DIV : unit terminal
      | T_COS : unit terminal
      | T_COPY : unit terminal
      | T_CONS : unit terminal
      | T_COMMA : unit terminal
      | T_COLOR : unit terminal
      | T_BOOL_LITERAL : (
# 12 "parser/Parser.mly"
       (bool)
# 2326 "parser/Parser.ml"
    ) terminal
      | T_BOOL : unit terminal
      | T_BLUE : unit terminal
      | T_BEGIN : unit terminal
      | T_AND : unit terminal
      | T_ADD : unit terminal
    
    type _ nonterminal = 
      | N_unary_operator : (Ast.unary_operator) nonterminal
      | N_type_expr : (Ast.type_expr) nonterminal
      | N_statement : (Ast.statement) nonterminal
      | N_program : (Ast.program) nonterminal
      | N_main : (Ast.program) nonterminal
      | N_field_accessor : (Ast.field_accessor) nonterminal
      | N_expression_list : (Ast.expression list) nonterminal
      | N_expression : (Ast.expression) nonterminal
      | N_binary_operator : (Ast.binary_operator) nonterminal
      | N_argument_list : (Ast.argument list) nonterminal
      | N_argument : (Ast.argument) nonterminal
    
  end
  
  include Symbols
  
  include MenhirLib.InspectionTableInterpreter.Make (Tables) (struct
    
    include TI
    
    include Symbols
    
    include MenhirLib.InspectionTableInterpreter.Symbols (Symbols)
    
    let terminal =
      fun t ->
        match t with
        | 0 ->
            X (T T_error)
        | 1 ->
            X (T T_Y)
        | 2 ->
            X (T T_X)
        | 3 ->
            X (T T_USUB)
        | 4 ->
            X (T T_TO)
        | 5 ->
            X (T T_TAIL)
        | 6 ->
            X (T T_SUB)
        | 7 ->
            X (T T_STRING)
        | 8 ->
            X (T T_STEP)
        | 9 ->
            X (T T_SIN)
        | 10 ->
            X (T T_SEMICOLON)
        | 11 ->
            X (T T_RSQ)
        | 12 ->
            X (T T_RPAR)
        | 13 ->
            X (T T_RED)
        | 14 ->
            X (T T_RCUR)
        | 15 ->
            X (T T_PRINT)
        | 16 ->
            X (T T_POS)
        | 17 ->
            X (T T_POINT)
        | 18 ->
            X (T T_OR)
        | 19 ->
            X (T T_NOT)
        | 20 ->
            X (T T_NE)
        | 21 ->
            X (T T_MUL)
        | 22 ->
            X (T T_MOD)
        | 23 ->
            X (T T_LT)
        | 24 ->
            X (T T_LSQ)
        | 25 ->
            X (T T_LPAR)
        | 26 ->
            X (T T_LIST)
        | 27 ->
            X (T T_LE)
        | 28 ->
            X (T T_LCUR)
        | 29 ->
            X (T T_INT)
        | 30 ->
            X (T T_IN)
        | 31 ->
            X (T T_IF)
        | 32 ->
            X (T T_ID)
        | 33 ->
            X (T T_HEAD)
        | 34 ->
            X (T T_GT)
        | 35 ->
            X (T T_GREEN)
        | 36 ->
            X (T T_GE)
        | 37 ->
            X (T T_FROM)
        | 38 ->
            X (T T_FOREACH)
        | 39 ->
            X (T T_FOR)
        | 40 ->
            X (T T_FLOOR)
        | 41 ->
            X (T T_FLOAT_OF_INT)
        | 42 ->
            X (T T_FLOAT)
        | 43 ->
            X (T T_EQ)
        | 44 ->
            X (T T_EOF)
        | 45 ->
            X (T T_END)
        | 46 ->
            X (T T_ELSE)
        | 47 ->
            X (T T_DRAW)
        | 48 ->
            X (T T_DOT)
        | 49 ->
            X (T T_DIV)
        | 50 ->
            X (T T_COS)
        | 51 ->
            X (T T_COPY)
        | 52 ->
            X (T T_CONS)
        | 53 ->
            X (T T_COMMA)
        | 54 ->
            X (T T_COLOR)
        | 55 ->
            X (T T_BOOL_LITERAL)
        | 56 ->
            X (T T_BOOL)
        | 57 ->
            X (T T_BLUE)
        | 58 ->
            X (T T_BEGIN)
        | 59 ->
            X (T T_AND)
        | 60 ->
            X (T T_ADD)
        | _ ->
            assert false
    
    and nonterminal =
      fun nt ->
        match nt with
        | 11 ->
            X (N N_argument)
        | 10 ->
            X (N N_argument_list)
        | 9 ->
            X (N N_binary_operator)
        | 8 ->
            X (N N_expression)
        | 7 ->
            X (N N_expression_list)
        | 6 ->
            X (N N_field_accessor)
        | 5 ->
            X (N N_main)
        | 4 ->
            X (N N_program)
        | 3 ->
            X (N N_statement)
        | 2 ->
            X (N N_type_expr)
        | 1 ->
            X (N N_unary_operator)
        | _ ->
            assert false
    
    and lr0_incoming =
      (8, "\000\016\"$<Vnr\0056Z\tZ\011\021B\005\022h\012\014\020\"4$4(:<BDRTVfn4p\003\017\014&*,.08FJXb\004\006\028\"Hnt\rdj\017xz\019\017\017l\017l\017\026\015\030\017l\015\017l\017\026\017l\017\026\017\014\017\022\007\023\022\021")
    
    and rhs =
      ((8, "\011\016\005\023\022\021\023z\014,d.x&X*0F8J<Vp\"4\017l\017\026n4\017l\017l\017\026$4\017l\017\026B\017\019\017\003\017\017b\r:\015\030\017j\017\017\017l\015n\"\006\004t\028H\tZZ\021\007h\017\017\022B\005\022<Vr\"n$\0056\014(D\012RTf\020"), (8, "\000\001\003\006\007\007\b\t\n\011\012\r\014\015\016\017\018\019\020\021\022\023\029%+,/147:;>>?@ABCDEGHJNQRSTUVWYZ[\\]^_`a"))
    
    and lr0_core =
      (8, "\000\001\002\003\004\005\006\007\b\t\n\011\012\r\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\030\031 !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\")
    
    and lr0_items =
      ((16, "\000\000\004\001\192\001\200\001\180\001\184\001\196\001\188\001\204\001\004\002\204\002\164\001\160\001\160\002\000\001\168\001\176\001\204\001\176\002\176\003\172\001\220\001\208\001\236\001T\001T\002\\\001\\\002\212\001p\001H\001`\001\216\001\224\001\228\001L\001\232\001X\001X\002P\001h\001t\001l\001h\002d\001\024\001,\0014\001\028\001$\0018\001@\001<\001D\0010\001l\002\144\001\140\001\152\001\136\001\156\001\132\001\148\001l\003 \001t\002t\003t\001l\001d\001(\001\020\001d\002t\001l\001d\003d\001t\001l\001d\001X\003X\004t\001l\001d\001X\005X\006t\001l\001d\001X\007X\bp\002p\003|\001x\001t\001l\001d\001|\002|\003t\001l\001d\001\\\003\\\004t\001l\001d\001\\\005\\\006t\001l\001d\001T\003T\004t\001l\001d\001T\005T\006\172\002t\001l\001d\001\208\001\024\001\172\003t\001l\001d\001\172\004\168\002\012\001\b\001\b\002\b\003"), (8, "\000\001\002\003\004\005\006\007\b\n\011\012\r\014\015\016\017\019\020\021\022\023\024\025\026\027\028\029\030\031 !\"#$%&'()-./0123456789:;<=>?@ABFGHIMQRVW[\\]^cdeijnostxy}\127\131\132\133\135\136\137"))
    
    and nullable =
      "\001 "
    
    and first =
      (61, "\001\000\000\000\128\b\016\0002\000\128\002\006\001\000\000\0000\001\000\b\000\160\000\000\000\001\000\000 \000\016\000\000\b\000\001\000\000\128\000\000@\004\b\001\128\018\000\000@\000\t\000\200\026\001\152\028\004`\006@\208\012\192\224#\000\016\001x\129@\130\000\192@\000\000\000\000\000\000\002\000\000\000\000\000\000\000")
    
  end) (ET) (TI)
  
end

let main =
  fun lexer lexbuf ->
    (Obj.magic (MenhirInterpreter.entry `Legacy 0 lexer lexbuf) : (Ast.program))

module Incremental = struct
  
  let main =
    fun initial_position ->
      (Obj.magic (MenhirInterpreter.start 0 initial_position) : (Ast.program) MenhirInterpreter.checkpoint)
  
end
