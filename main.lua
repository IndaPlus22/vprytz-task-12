function love.load()
    -- turtle starts in the middle of the screen
    turtle = {
        x = love.graphics.getWidth() / 2,
        y = love.graphics.getHeight() / 2,
        multiplier = 10
    }

    track = {}

    count = 0

    -- set title and window
    love.window.setMode(960, 720, {
        resizable = true,
        vsync = 0
    })
    love.window.setTitle("IndaPlus22/vprytz-task-12")
end

function love.update(dt)
    count = count + dt
    if count > 0.1 then
        -- add current pos of turtle to "track"
        table.insert(track, {turtle.x, turtle.y})

        -- get random direction, move turtle that way
        local direction = math.random(1, 4)
        if direction == 1 then
            turtle.x = turtle.x + turtle.multiplier
        elseif direction == 2 then
            turtle.x = turtle.x - turtle.multiplier
        elseif direction == 3 then
            turtle.y = turtle.y + turtle.multiplier
        elseif direction == 4 then
            turtle.y = turtle.y - turtle.multiplier
        end
        count = 0
    end
end

function love.draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.print("Current FPS: " .. tostring(love.timer.getFPS()), 10, 10)

    -- draw track
    for i, v in ipairs(track) do
        love.graphics.setColor(255, 255, 255)
        love.graphics.rectangle("fill", v[1], v[2], 10, 10)
    end

    -- draw turtle
    love.graphics.setColor(0, 255, 0)
    love.graphics.rectangle("fill", turtle.x, turtle.y, 10, 10)
end
