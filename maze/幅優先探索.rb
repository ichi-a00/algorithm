input_line = gets
$m = input_line.split[0].to_i
$n = input_line.split[1].to_i
$grid = []

#MAP
for j in 0...$n
    input_line = gets
    $grid[j] = input_line.split
end

sx = false
sy = false

#START POSITION
for j in 0...$n
    for i in 0...$m
        case $grid[j][i]
        when "s" then
            sx = i
            sy = j
        when "0" then
            $grid[j][i] = Float::INFINITY
        when "1" then
            $grid[j][i] = "#"
        when "g" then
            $grid[j][i] = Float::INFINITY
            gx = i
            gy = j
        end
    end
end

$grid[sy][sx]=0

#p $grid

#幅優先
route = [[sx, sy]]

while route != [] do
    
    x, y = route.shift
    
    #p "now: [#{x}, #{y}]"
    #p route
    
    for (next_x, next_y) in [[x-1, y], [x, y-1], [x+1, y], [x, y+1]]
    
        #端はスキップ
        if (next_x < 0 || next_x >= $m || next_y < 0 || next_y >= $n) then
            next
        end
    
        dist = $grid[next_y][next_x]
        
        if dist!='#' then
            #p "next: [#{next_x}, #{next_y}]"
            if dist > $grid[y][x]+1 then
                $grid[next_y][next_x] = $grid[y][x]+1
                route.push([next_x, next_y])
            end
        end
    end
end

#p $grid[gy][gx]

if $grid[gy][gx] == Float::INFINITY then
    puts "Fail"
else
    puts $grid[gy][gx]
end
