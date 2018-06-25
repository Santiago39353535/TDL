local Map L F ElevarAlCuadrado X M in
  
   fun {Map L F}
      case L of H|T then
	 {F H}|{Map T F}
      else
	 nil
      end
   end

   fun {ElevarAlCuadrado X}
      X*X
   end

   M = [1 2 3]
   {Browse {Map M ElevarAlCuadrado}}
   {Browse M}

end
