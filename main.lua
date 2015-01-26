local bg = display.newImage("bg_earth.jpg")
bg.x = 964/2
bg.y = 507
 
local ship = display.newImage("ship03.png")
ship.x = 500
ship.y = 200
ship.name = "ship"
 
-- understood proprierties of bezier curve
--local curve = bezier:curve({xInitial, xControlPoint1, xControlPoint2, xControlPoint3}, {yInitial, yControlPoint1, yControlPoint2, yControlPoint3})

local bezier = require('bezier') 
local curve =  bezier:curve({350, 1100, 350},{ 1080, 686, 500})
local x1, y1 = curve(10.51)
local line3 = display.newLine(x1, y1, x1+1, y1+1)
line3:setColor(0, 0, 255, 255 )
-- imput 0 (zero) value in line below for don´t see the line
line3.width = 3
 
for i=0.02, 1.01, 0.01 do
  local x, y = curve(i)
  line3:append(x, y)
  print(i, x, y)
end
 
-- move ship along curve
local pointInc = 0.00
 
local function follow (event )
  if pointInc < 1.01 then
        ship.x, ship.y = curve(pointInc)
        --print(pointInc,ship.x, ship.y)
        pointInc = pointInc + 0.01
     else
         Runtime:removeEventListener("enterFrame",follow)
     end
end
 
Runtime:addEventListener("enterFrame",follow);
