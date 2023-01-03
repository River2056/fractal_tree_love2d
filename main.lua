function love.load()
    initial_length = 200
    angle = math.pi / 7
    WIDTH = love.graphics.getWidth()
    HEIGHT = love.graphics.getHeight()
end

function love.update(dt) end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

    if key == "up" then
        angle = angle + 0.01
    end

    if key == "down" then
        angle = angle - 0.01
    end
end

function love.draw()
    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.push()
    love.graphics.translate(WIDTH / 2, HEIGHT)
    branch(initial_length)
    love.graphics.pop()
end

function branch(len)
    love.graphics.line(0, 0, 0, -len)
    love.graphics.translate(0, -len)
    if len >= 35 then
        love.graphics.push()
        love.graphics.rotate(angle)
        branch(len * 0.67)
        love.graphics.pop()
        love.graphics.push()
        love.graphics.rotate(-angle)
        branch(len * 0.67)
        love.graphics.pop()
    end
end
