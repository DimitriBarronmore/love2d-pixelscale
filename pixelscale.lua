local center = require "center"
local ps = {}

function ps:setupCanvas(width, height)
	self._canvas = love.graphics.newCanvas(width, height)
	self._canvas:setFilter("nearest", "nearest")
	center:setupScreen(width, height)
end

function ps:start()
	self._prev_canvas = love.graphics.getCanvas()
	love.graphics.setCanvas(self._canvas)
	love.graphics.clear( )
end

function ps:finish()
	love.graphics.setCanvas(self._prev_canvas)
end

function ps:draw(...)
	local mode, alphamode = love.graphics.getBlendMode()
	center:start()
	love.graphics.setBlendMode("alpha", "premultiplied")

	love.graphics.draw(self._canvas, ...)

  	center:finish()
  	love.graphics.setBlendMode(mode, alphamode)
end

function ps:resize(width, height)
	center:resize(width, height)
end

function ps:resizeCanvas(width, height)
	self._canvas:release()
	self._canvas = love.graphics.newCanvas(width,height)
	center._WIDTH = width
	center._HEIGHT = height
	center:apply()
end

function ps:toGame(x, y)
	return center:toGame(x,y)
end

return ps