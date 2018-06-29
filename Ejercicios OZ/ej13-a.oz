local X V V2 V3 V4 Dicc in

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

      meth get(Clave Valor)
	 if @clave==nil then
	    Valor=nil
	 elseif @clave==Clave then
	    Valor=@valor
	 elseif @clave > Clave then
	    {@hijoD get(Clave Valor)}
	 else
	    {@hijoI get(Clave Valor)} 
	 end   
      end

      meth domain(L)
	 
      end
   end

end