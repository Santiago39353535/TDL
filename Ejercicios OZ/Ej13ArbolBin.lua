Arbol = {clave=nil,valor,hijoD=nil,hijoI=nil}

function Arbol:new(obj)
	obj = obj or {}					
	self.__index = self 	    	
	setmetatable(obj, self)	
	return obj
end

function Arbol:put(clave, valor)
	if self.clave == nil then
		self.clave = clave
		self.valor = valor
	end
	if self.clave < clave then
		if hijoD == nil then
			hijoD = Arbol:new()
		end
		hijoD:put(clave,valor)
	end
	if self.clave > clave then
		if hijoI == nil then
			hijoI = Arbol:new()
		end
		hijoI:put(clave,valor)
	end
end

function Arbol:get( clave )
	if self.clave == clave then
		return self.valor
	elseif self.clave < clave then
		if hijoD ~= nil then
			return hijoD:get(clave)
		else return nil end
	elseif self.clave > clave then
		if hijoI ~= nil then
		return hijoI:get(clave)
		else return nil end
	end
end


arbol = Arbol:new()
arbol:put('B', 4)
arbol:put('c', 9)
print(arbol:get('B'))
print(arbol:get('c'))
print(arbol:get('a'))