/* El servidor va a filtrar numeros pares */

local NewPortObject2 RecibirMsg in
     fun {NewPortObject2 Proc}
	Sin in
	thread for Msg in Sin do {Proc Msg} end end
	{NewPort Sin}
     end

     local Server Agent1 Agent2 ServerFilter ClienteProc ClienteBrow in
	ServerFilter = proc {$ Msg}
			  case Msg of
			     filter(N F) then
			     F= ((N mod 2) == 0)
			  end
		     end 

	Server = {NewPortObject2 ServerFilter}
	
	ClienteProc = proc{$ Msg}
			 local R in
			    {Send Server filter(Msg R)}
			    if R then
				  {Send Agent2 Msg}
			       else
			       {Browse 'No se envia el msg'}
			    end
			 end
		      end
 
	ClienteBrow = proc{$ Msg}
			 {Browse 'Recibi el mensaje'#Msg}
		      end
	Agent1={NewPortObject2 ClienteProc}
	Agent2={NewPortObject2 ClienteBrow}
	{Send Agent1 4}
	{Send Agent1 3}
     end
end

			
			 
			 