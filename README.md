## What is this?

By harnessing the power of [center.lua](https://github.com/S-Walrus/center), I have mastered the art of throwing a canvas of a given size onto the screen and scaling it up to fill the available space. That's really all this does. Calling it a tiny wrapper around Center wouldn't be terribly inaccurate. 

## How to use????

Throw center.lua and pixelscale.lua into the root of your Love project, and set up pixelscale like such:

```lua
local pscale = require "pixelscale"
pscale:setupCanvas(640, 480)

function love.draw()
	pscale:start()
		-- draw to the canvas here
	pscale:finish()

	pscale:draw() -- draw the canvas centered to the screen
end

function love.resize(width, height)
	pscale:resize(width, height)
end
```

## Full API

### pixelscale:setupCanvas(width, height)
Initializes pixelscale by creating a canvas of the specified size, and passing the size to Center.

### pixelscale:resizeCanvas(width,height)
Releases the existing canvas and creates a new one of the given size, and then alters Center's configured size to match.

### pixelscale:start( )
Sets the canvas as the draw target, and automatically clears it to transparent black.

### pixelscale:finish( )
Sets the draw target back to the previous canvas.

### pixelscale:draw( ... )
Draws the canvas to the screen, centered using Center, using premultiplied alpha (just in case), and passing the given arguments to `love.graphics.draw`.

### pixelscale:resize(width, height)
Calls `center:resize(width, height)` for ease of use.

### pixelscale:toGame(x, y)
Returns `center:toGame(x,y)` for ease of use.