local Dicc D L in
   class Dicc
      attr clave valor hijoD hijoI
 
      meth newDicc
	 clave:=nil
	 valor:=0
      end
   
      meth put(Clave)
	 if @clave==nil then
	    clave:=Clave
	    valor:= 1
	    hijoD:={New Dicc newDicc}
	    hijoI:={New Dicc newDicc}
	 elseif @clave == Clave then
	    valor:= @valor +1
	 elseif @clave > Clave then
	    {@hijoD put(Clave)}
	 else
	    {@hijoI put(Clave)}
	 end
      end

      meth get(Clave $)
	 if @clave==Clave then
	    @valor
	 elseif @clave > Clave then
	    {@hijoD get(Clave)}
	 else
	    {@hijoI get(Clave)} 
	 end   
      end

     /* meth domain(L)
	 local Recorrer in	    
	    Recorrer = proc{$ Clave R}
			  if ~(@clave == nil) then
			     _ = {Append L @clave}
			     {Recorrer @hijoI L}
			     {Recorrer @hijoD L}
			  else
			     R=L
			  end
		       end
	 end
      end*/

      meth inor(L $)
	 if ~(@clave == nil) then
	    L= L|@clave
	    {@hijoI inor(L)}
	    {@hijoD inor(L)}
	 else
	    L
	 end
      end
      
      
      
   end
   L=[0]
   D = {New Dicc newDicc}
   {D put('h')}
   %{D put('o')}
   %{D put('o')}
   {Browse {D get('h' $)}}
   {Browse {D inor(L $)}}
end