function myfunction ()
   n = n/nil
end

if pcall(myfunction) then
   print("Success")
else
	print("Failure")
end


function myerrorhandler( err )
   print( "ERROR:", err )
end

status = xpcall( myfunction, myerrorhandler )
print( status)