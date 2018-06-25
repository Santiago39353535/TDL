local Largo Take Drop Append Member Position L L2 in
%1-1   
      Largo = fun {$ L}
      	     case L of H|T then
		1 + {Largo T}
	     else
		0
	     end
	end
%1-2
   Take = fun {$ L N}
	     if {Largo L} < N then
		   L
	     elseif N == 0 then
		nil
	     else
		   case L of H|T then
		      H| {Take T N-1}
		   end
		end
	  end

%1-3
   Drop = fun{$ L N}
	     if {Largo L} < N then
		   nil
	     elseif N == 0 then
		L
	     else
		   case L of H|T then
		      {Drop T N-1}
		   end
		end
	  end

%1-4
   Append = fun {$ L1 L2}
	       case L1 of H|T then
		  H|{Append T L2}
	       else
		  L2
	       end
	    end
%1-5
   Member = fun {$ L Y}
	       case L of H|T then
		  if H == Y then
		     true
		  else {Member T Y}
		  end
	       else
		  false
	       end
	    end

%1-6
   Position = fun {$ L Y}
		 case L of H|T then
		    if H == Y then
		      1
		    else
		        1 + {Position T Y}
		    end
		 end
	      end
		   
		    
L = [1 2 3 4 5 6]
L2 = [ 7 8 9]
{Browse {Position L 4}}
end