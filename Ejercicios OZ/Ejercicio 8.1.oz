/*Un problema que ocurre con frecuencia en la práctica es tener que esperar hasta que
al menos una de dos variables se ligue. Para esto, OZ provee el procedimiento {WaitOr
X Y}, que suspende la ejecución del hilo que lo llama hasta que X o Y se liguen. Escribir
un procedimiento {WaitSome Xs}, que suspenda la ejecución del hilo que lo llamó hasta
que al menos una de las variables de la lista Xs se ligue.
Mostrar con un ejemplo su utilización.*/

local M M2 WaitSome Map Fib in  
   fun {Map L F}
      case L of H|T then
	 thread {F H} end|{Map T F}
      else
	 nil
      end
   end

   fun {Fib X}
      {Delay 800}
      case X
      of 0 then 1
      [] 1 then 1
      else thread {Fib X-1} end  + {Fib X-2} end 
   end

   proc {WaitSome Xs}
      case Xs of Xr|nil then
	 {Wait Xr}
      [] H1|H2|T then
	 {WaitOr H1 H2}
	 {WaitSome T}
      else skip
      end
   end

   M = [10]
   M2 = {Map M Fib}
   {WaitSome M2}
   {Browse M2}
   
end