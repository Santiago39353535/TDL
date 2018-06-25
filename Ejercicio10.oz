local NewPortObject2 RecibirMsg Agente in
     fun {NewPortObject2 Proc}
	Sin in
	thread for Msg in Sin do {Proc Msg} end end
	{NewPort Sin}
     end
     
     RecibirMsg = proc {$ Msg}
		   {Browse Msg}
		  end
     Agente = {NewPortObject2 RecibirMsg}

    {Send Agente 'hola'}
    {Send Agente 'chau'}
end

