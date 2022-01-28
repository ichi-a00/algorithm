input_line = gets.split(" ")

a = input_line[0].to_i
b = input_line[1].to_i
x = input_line[2].to_i
y = input_line[3].to_i
r = input_line[4].to_i
theta = input_line[5].to_f
L = input_line[6].to_i

#進む距離（ほんとはスカラーなのにプラマイだけある）
xx = Math.cos(theta / 180 * Math::PI)*L
yy = Math.sin(theta / 180 * Math::PI)*L

#最初跳ね返るか？　跳ね返るならそのあまりがbottom
if (xx>0) then
    if (a-x-r > xx)
        #跳ね返らない
        xxx = xx + x
    else
        bottom_x = (xx-(a-x-r)) % (a-2*r)
        
        if ( ((xx-(a-x-r)) / (a-2*r)).floor % 2 == 0 )
            xxx = a-r-bottom_x
        else
            xxx = r+bottom_x
        end
    end
else
    xx *= -1 
    if (x-r > xx)
        xxx = x - xx
    else
        bottom_x = (xx-(x-r)) % (a-2*r)
        
        if ( ((xx-(x-r)) / (a-2*r)).floor % 2 == 0 )
            xxx = r+bottom_x
        else
            xxx = a-r-bottom_x
        end 
    end
end

if (yy>0) then
    if (b-y-r > yy)
        yyy = yy + y
    else
        bottom_y = (yy-(b-y-r)) % (b-2*r)
        
        if ( ((yy-(b-y-r)) / (b-2*r)).floor % 2 == 0 )
            yyy = b-r-bottom_y
        else
            yyy = r+bottom_y
        end        
    end    
else
    yy *= -1     
    if (y-r > yy)
        yyy = y - yy
    else
        bottom_y = (yy-(y-r)) % (b-2*r)

        if ( ((yy-(y-r)) / (b-2*r)).floor % 2 == 0 )
            yyy = r+bottom_y
        else
            yyy = b-r-bottom_y
        end
    end
end

puts [xxx, yyy].join(" ")
