local Filter L EsPar X in
   fun {Filter L F}
      case L of H|T then
	 if {F H} then H|{Filter T F}
	 else
	    {Filter T F}
	 end
      else
	 nil
      end
   end
  
   fun {EsPar X}
     (X mod 2) == 0
   end
   

   L = [2]
   
   {Browse {Filter L EsPar}}
   {Browse L}
end

   
	    
	 