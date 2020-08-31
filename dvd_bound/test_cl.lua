local rand = {-1.5, 1.5}
local mx, my = rand[math.random(#rand)], rand[math.random(#rand)]
local x, y = 50, 100
local scx, scy = guiGetScreenSize()

local color = tocolor(math.random(255), math.random(255), math.random(255), 255)
local dvd = dxCreateTexture("dvd.png")
local w,h = dxGetMaterialSize(dvd)
w, h = w/6, h/6
local posx, posy = scx/2-(w/2 * scx/1920), scy/2-(h/2 * scy/1080)

addEventHandler("onClientRender", root, function()
	local checker = false
	if posx<=0 then
		posx=0
		mx=7
		checker = true
	elseif posx+w>=scx then
		posx=scx-w
		mx=-7
		checker = true
	end
	if posy<=0 then
		posy=0
		my=7
		checker = true
	elseif posy+h>=scy then
		posy=scy-h
		my=-7
		checker = true
	end
	posx = posx + mx
	posy = posy + my
	if checker then
		color = tocolor(math.random(255), math.random(255), math.random(255), 255)
	end
	dxSetBlendMode("modulate_add")
	dxDrawImage(posx, posy, w, h, dvd, 0,0,0, color)
	dxSetBlendMode("blend")
end)