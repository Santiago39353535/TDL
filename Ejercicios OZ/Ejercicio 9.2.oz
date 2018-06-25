local Reverse1 Reverse2 L1 L2 L3 in 
   fun lazy {Reverse1 S}
      local Rev in
	 fun {Rev S R}
	    case S of nil then R
	    [] X|S2 then {Rev S2 X|R}
	    end
	 end
	 {Rev S nil}
      end
   end

   fun lazy {Reverse2 S}
      local Rev in
	 fun lazy {Rev S R}
	    case S of nil then R
	    [] X|S2 then {Rev S2 X|R}
	    end
	 end
	 {Rev S nil}
      end
   end
   L1 = [1 2 3 4]
   L2 = {Reverse1 L1}
   L3 = {Reverse2 L1}
  
   {Browse L2.2.2.1}
   {Browse L2}
   {Browse L3.2.2.2.1}
   {Browse L3}
end

/*La diferencia es que Reverse1 invierte toda la lista al momento que se quiere acceder a un dato de ella,
mientras que Reverse2 modifica la lista a medida que se necesita el dato.

Ambos dan el mismo resultado.*/ 