%{
    /********************************NOTAS*********************************************
    [EDUARDO]:
        O que fiz até agora foi apenas incluir alguns dos tokens e dar o respetivo print de acordo com o pedido no enunciado. 
        Em relação ao INTLIT vou enviar ao prof um mail a perguntar se é suposto aceitar
            apenas numeros decimais ou se os hexadecimais e os octa tb contam..
        Testar o REALLINT só para verificar q está a funcionar bem....
        Faltam incluir: CHRLIT 
    ===================================================================================
    [RODRIGO]: Vê se o uso do signal (onde foi usado nas regras), faz sentido
    

    ***********************************************************************************/
    //COMPILADORES 2020
    //Eduardo Filipe Ferreira Cruz  2018285164
    //Rodrigo ... Sobral    ...
    #include <string.h>

    int printFlag=0; //if 0(default), print error_messages only; else print all tokens and error_messages

%}
letter  [A-Za-z_]
digit   [0-9]
digits  digit+
signal  [+-]?
exp [Ee]{signal}{digits}
reserved    "++"|"--"|"["|"]"|"auto"|"break"|"case"|"const"|"continue"|"default"|"do"|"enum"|"extern"|"float"|"for"|"float"|"goto"|"long"|"register"|"return"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"volatile"|"inline"|"inline"|"_Bool"|"_Complex"|"_Imaginary"
id  letter(letter|digit)*
%%
char    {if(printFlag){printf("CHAR\n");}}
int {if(printFlag){printf("INT\n");}}
short   {if(printFlag){printf("SHORT\n");}}
double  {if(printFlag){printf("DOUBLE\n");}}
void    {if(printFlag){printf("VOID\n");}}
if  {if(printFlag){printf("IF\n");}}
else    {if(printFlag){printf("ELSE\n");}}
while   {if(printFlag){printf("WHILE\n");}}
return  {if(printFlag){printf("RETURN\n");}}
{reserved}  {if(printFlag){printf("RESERVED(%s)\n",yytext);}}
"(" {if(printFlag){printf("LPAR\n");}}
")" {if(printFlag){printf("RPAR\n");}}
"{" {if(printFlag){printf("LBRACE\n");}}
"}" {if(printFlag){printf("RBRACE\n");}}
";" {if(printFlag){printf("SEMI\n");}} 
"," {if(printFlag){printf("COMMA\n");}} 
"&&"    {if(printFlag){printf("AND\n");}}
"||"    {if(printFlag){printf("OR\n");}}
"&" {if(printFlag){printf("BITWISEAND\n");}}
"|" {if(printFlag){printf("BITWISEOR\n");}}
"^" {if(printFlag){printf("BITWISEXOR\n");}}
"!="    {if(printFlag){printf("NE\n");}}
"=="    {if(printFlag){printf("EQ\n");}}
">="    {if(printFlag){printf("GE\n");}}
">" {if(printFlag){printf("GT\n");}}
"<="    {if(printFlag){printf("LE\n");}}
"<" {if(printFlag){printf("LT\n");}}
"!" {if(printFlag){printf("NOT\n");}}
"=" {if(printFlag){printf("ASSIGN\n");}}
"*" {if(printFlag){printf("MUL\n");}}
"+" {if(printFlag){printf("PLUS\n");}}
"-" {if(printFlag){printf("MINUS\n");}}
"/" {if(printFlag){printf("DIV\n");}}
"%" {if(printFlag){printf("MOD\n");}}


({signal}{digits}(("."{digits}?{exp}?)|{exp}))|("."{digits}{exp}?)  {printf("REALLIT(%s)\n",yytext);}
{signal}{digits}    {printf("INTLIT(%s)\n",yytext);}
{id}    {printf("ID(%s)\n",yytext);}    

%%
int main(int argc, char** argv){
    if(argc==2){
        if(strcmp(argv[1],"-l")==0||strcmp(argv[1],"-e1")==0){
            printFlag=1; //stdout print tokens and error_messages
        }
    }
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}