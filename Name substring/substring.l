%{
    #include <stdio.h>
    #include <string.h>
    int flag=0;
    char n[50]="";
%}

%%
[a-zA-z]* {if (strstr(yytext,"aish")!=NULL){
              flag=1;
          }
          strcpy(n,yytext);
         }
[\n]     {if (flag==1){
              printf("%s contains substring aish\n",n);
              strcpy(n,"");
              flag=0;
          }
          else{
              printf("Not found\n");
              strcpy(n,"");
          }
         };
%%
int yywrap(){
    return 1;
}
int main(){
   printf("Enter string\n");
   yylex();
   return 0;
}
