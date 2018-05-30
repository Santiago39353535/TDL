function factorial(n)
	if n<=1 then return 1
	else
		return n*factorial(n-1)
	end
end

--print(factorial(3))



a = {"uno","dos","tres"}
print(#a)    --> 4

a[5]="asd"

print(#a)

for i=1,#a do
	print(a[i])
end

