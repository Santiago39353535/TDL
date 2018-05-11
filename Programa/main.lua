function love.load()
	empezo = false
	player1={}
	player2={}
	player1.y=200
	player1.x = 750
	player2.y=200
	player2.x = 20

	bola = {}
	bola.x = 50
	bola.y = player1.y + 50
	bola.velocidadx = 10
	bola.velocidady = 0

	rectanguloAncho= 20
	rectanguloLargo= 100
end

function love.update(dt)
	if love.keyboard.isDown("space") then
		empezo = true
	end

	moverBola(empezo)
	moverseJugador1()
	moverseJugador2()
	manejoColisiones(player1,bola)
	manejoColisiones(player2,bola)

end


function love.draw()
	love.graphics.setColor(0, 100,255)
	love.graphics.rectangle("fill",player1.x, player1.y, rectanguloAncho, rectanguloLargo)

	love.graphics.setColor(250, 0,100)
	love.graphics.rectangle("fill", player2.x, player2.y, rectanguloAncho, rectanguloLargo)
	
	love.graphics.setColor(255,255,255)
	love.graphics.circle("fill", bola.x, bola.y, 10)

end


function moverseJugador1 ()
	if love.keyboard.isDown("up") then
		if player1.y > 0 then
			player1.y=player1.y-5
		end
	elseif love.keyboard.isDown("down") then
		if player1.y < 500 then
			player1.y=player1.y+5
		end
	end
end

function moverseJugador2 ()
	if love.keyboard.isDown("w") then
		if player2.y > 0 then
			player2.y=player2.y-5
		end
	elseif love.keyboard.isDown("s") then
		if player2.y < 500 then
			player2.y=player2.y+5
		end
	end
end

function moverBola (comienzo)
	if (comienzo and bola.x<780 and bola.x>15) then
		bola.x = bola.x + bola.velocidadx
		bola.y = bola.y + bola.velocidady
	end
end

function manejoColisiones(jugador,bola)
	if (((bola.y < jugador.y+rectanguloLargo) and (bola.y > jugador.y)) and (bola.x == jugador.x+10)) then
		bola.velocidadx = -bola.velocidadx
	end
end
