/* lexical grammar */
%lex
%%

[bcdfghjklmnpqrtsvwxzBCDFGHJKLMNPQRSTVWXZ]  return 'CONSONANT'
<<EOF>>               return 'EOF'
.                     return 'OTHER'

/lex

%start expressions

%% /* language grammar */

expressions
    : expr EOF
        {return $1;}
    ;

expr
    : char expr
        {$$ = $1 + $2;}
    | char
        {$$ = $1;}
    ;

char
    : CONSONANT
        {$$ = $1 + 'o' + $1.toLowerCase();}
    | OTHER
        {$$ = $1;}
    ;
