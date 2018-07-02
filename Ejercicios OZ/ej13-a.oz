local Dicc D L Sort Merge Split in

   fun {Sort Dicc L}
      case L of nil then nil
      [] X|nil then L
      else
	 local Xs Ys in
	    {Split L Xs Ys}
	    {Merge Dicc {Sort Dicc Xs} {Sort Dicc Ys}}
	 end
      end
   end

   fun {Merge Dicc L1 L2}
      case L1#L2 of (H1|T1)#(H2|T2) then
	 local V1 V2 in
	    {Dicc get(H1 V1)}
	    {Dicc get(H2 V2)}
	    if V1 > V2 then
	       H1|{Merge Dicc T1 L2}
	    else
	       H2|{Merge Dicc L1 T2}
	    end
	 end
      [] L1#nil then
	 L1
      else
	 L2
      end
   end


   proc {Split L R1 R2}
      case L of H1|H2|T then
	 local U V in
	    R1 = H1|U
	    R2= H2|V
	    {Split T U V}
	 end
      [] X then R1 = L R2 = nil
      [] nil then R1=nil R2 = nil
      end
   end

   
   class Dicc
      attr clave valor hijoD hijoI
 
      meth newDicc
	 clave:=nil
	 valor:=0
	 hijoD:= nil
	 hijoI:= nil
      end
   
      meth put(Clave)
	 if @clave==nil then
	    clave:=Clave
	    valor:= 1
	 elseif @clave == Clave then
	    valor:= @valor +1
	 elseif @clave > Clave then
	    if @hijoD == nil then hijoD:={New Dicc newDicc} end
	    {@hijoD put(Clave)}
	 else
	    if @hijoI == nil then hijoI:={New Dicc newDicc} end
	    {@hijoI put(Clave)}
	 end
      end

      meth get(Clave V)
	 if @clave==Clave then
	    V=@valor
	 elseif @clave > Clave then
	    if @hijoD == nil then
	       V=nil
	    else
	       {@hijoD get(Clave V)}
	    end
	 else
	    if @hijoI == nil then
	       V=nil
	    else
	       {@hijoI get(Clave V)}
	    end
	 end   
      end

      meth domain(L)
	 local U in
	    {self Inor(U false)}
	    L={Sort self U}
	 end
      end
      
      meth Inor(L B)
	 if{And (@hijoD == nil)  (@hijoI==nil)} then
	    if B then L = @clave|nil
	    else
	       L = @clave
	    end 
	 end
	 
	 if {And (@hijoD \= nil) (@hijoI \= nil)} then
	    local U V in
	       L = U|@clave|V
	       {@hijoD Inor(U false)}
	       {@hijoI Inor(V true)}
	    end
	 end
	 
	 if {And (@hijoD \= nil) (@hijoI == nil)} then
	    local U in
	       L=U|@clave
	       {@hijoD Inor(U false)}
	    end
	 end
	 
	 if {And (@hijoD == nil) (@hijoI \= nil)} then
	    local U in
	       L=@clave|U
	       {@hijoI Inor(U true)}
	    end
	 end
      end
      
   end
   D = {New Dicc newDicc}
   {D put('h')}
   {D put('o')}
   {D put('a')}
   {D put('a')}
   {D put('o')}
   {D put('o')}
   
   {D domain(L)}
   {Browse L}
end