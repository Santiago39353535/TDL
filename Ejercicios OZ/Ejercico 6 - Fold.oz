%Las funciones de tipo Fold son unas de las funciones de alto orden mas comunes

%Generalmente toman una lista (o secuencia), una funcion que recibe 2 elementos
%y un valor inicial. Se combina la secuencia aplicando la funcion recibida
%elemento por elemento.

%Puede ser asociativo a izq o a der.

%{FoldL L F U} realiza: {F...{F{F{F U X1}X2}X3}... Xn}

%L = {x1,x2,x3...,xn}


%{FolfR L F U} realiza: {F X1{F X2{F X3 ...{F Xn U}...}}} 


%Desarrollaras y hacer un ejemplo

local FoldL FoldR L Div in
   
   fun {FoldL L F U}
      case L of nil then U	 
      [] H|T then {FoldL T F {F U H}}
      end
   end

   fun {FoldR L F U}
      case L of nil then U	 
      [] H|T then {F H {FoldR T F U}}
      end
   end

   fun {Div X Y}
      X div Y
   end

   
   L = [34 56 12 4 23]   
   {Browse {FoldL L Div 7}}
   {Browse {FoldR L Div 7}}
end

