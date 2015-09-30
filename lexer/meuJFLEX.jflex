package generated.lexer;

%%

/* 
A linha atual pode ser acessada por yyline 
e a coluna atual com yycolumn. 
*/ 
%line
%column

/* Se quisermos 'interfacear' com um parser gerado pelo sistema CUP
%cup
*/ 

//encoding
%unicode

// faz com que a classe tenha uma funÃ§Ã£o main e torna possivel que a classe gerada seja usada como reconhecedor
%standalone

//nomeia a classe
%class GenerateLexer

/* 
Declarações

código dentro de %{ e %}, é copiado para a classe gerada. 
a ideia é utilizar este recurso para declarar atributos e métodos usados nas ações 
*/ 

%eof{
%eof}

/*-*
 * PADROES NOMEADOS:
 */
letter          = [A-Z] | [a-z]
digit           = [0-9]
integer         = {digit}+
alphanumeric    = {letter}|{digit}
whitespace      = [ \n\t\r]
comment			= "/*" [^*] ~"*/" | "/*" "*"+ "/"
identifier		= ({letter} | _)({letter} | _ | {digit})*
literal_inteiro	= [1-9]({digit})* | [0]
literal_ponto_flutuante	= {literal_inteiro}[.]({digit})+ (([e] | [E]) {integer})?

%%
/**
 * REGRAS LEXICAS:
 */
 
//Palavras-Chave
"class" | "public" | "extends" | "static" | "void" | "int" | "boolean" | "while" | "if" | "else" | "return" { System.out.println("Palavras-chave: " + yytext()); }
 
//Operadores
"||" | "&&" | "==" | "!=" | "<" | "<=" | ">" | ">=" | "+" | "-" | "*" | "/" | "%" | "!" | "false" | "true" | "this" | "new"  { System.out.println("Operadores: " + yytext()); }
 
//Delimitadores
";" | "." | "," | "=" | "(" | ")" | "{" | "}" | "[" | "]" { System.out.println("Delimitador: " + yytext()); }

{literal_inteiro}	{ System.out.println("inteiro: " + yytext()); }
{literal_ponto_flutuante}	{ System.out.println("float: " + yytext()); }
{identifier}	{ System.out.println("id: " + yytext()); }
{comment}		{ System.out.println("comment: " + yytext()); }
{whitespace}    { /* Ignorar whitespace. */ }
.               { System.out.println("Illegal char, '" + yytext() +
                    "' line: " + yyline + ", column: " + yycolumn); }
