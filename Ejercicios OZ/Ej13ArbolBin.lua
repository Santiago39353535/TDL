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
		if self.hijoD == nil then
			self.hijoD = Arbol:new()
		end
		self.hijoD:put(clave,valor)
	end
	if self.clave > clave then
		if self.hijoI == nil then
			self.hijoI = Arbol:new()
		end
		self.hijoI:put(clave,valor)
	end
end

function Arbol:get( clave )
	if self.clave == clave then
		return self.valor
	elseif self.clave < clave then
		if self.hijoD ~= nil then
			return self.hijoD:get(clave)
		else return nil end
	elseif self.clave > clave then
		if self.hijoI ~= nil then
		return self.hijoI:get(clave)
		else return nil end
	end
end


arbol = Arbol:new()
arbol:put('B', 4)
arbol:put('c', 9)
print(arbol:get('B'))
print(arbol:get('c'))
print(arbol:get('a'))