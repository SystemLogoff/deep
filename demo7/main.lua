package.path = package.path .. ";../?.lua"
local deep = require "../deep"

local current_z = 1

-- Draws a rectangle at passed y coordinate
local draw_line = function(y)
  love.graphics.setColor(255, 255, 255) -- Reset color
  love.graphics.rectangle("fill", 200, y, 300, 10)
end

function love.draw()
  deep.queue(2, draw_line, 60)
  deep.queue(3, draw_line, 80)
  deep.queue(4, draw_line, 100)


  -- Red square, which can move through z axis
  deep.queue(current_z, function()
    love.graphics.setColor(255, 0, 0) -- Set color to red
    love.graphics.rectangle("fill", 300, 40, 80, 80)
  end)

  -- Draw everything in the queue
  deep.execute()
end

-- Increases/decreases red square z on key press
function love.keypressed(key)
  if key == "up" then
    current_z = current_z + 1
  elseif key == "down" then
    current_z = current_z - 1
  end
end
