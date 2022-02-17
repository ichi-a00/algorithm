input_line = gets
$h = input_line.split[0].to_i
$w = input_line.split[1].to_i
$grid = []

#MAP
for j in 0...$h
    input_line = gets
    $grid[j] = input_line.chomp.chars
end

#p $grid

#色を探る
def struggle(x, y, color)
    
    #p "now(#{x}, #{y})"
    
    #既に見たところとして疑似壁@にする
    $grid[y][x] = "@"
    
    #上下左右を調べる
    for (next_x, next_y) in [[x-1, y], [x, y-1], [x+1, y], [x, y+1]]
    
        #端はスキップ
        if (next_x < 0 || next_x >= $w || next_y < 0 || next_y >= $h) then
            next
        end
        
        #他の色はスキップ
        if $grid[next_y][next_x] != color then
            next
        end

        #既に見たところはスキップ　※他の色はスキップのところで弾かれるから要らんね
        if $grid[next_y][next_x] == "@" then
            next
        end       
        
        
        #同じ色なら再帰処理
        struggle(next_x, next_y, color)
    
    end
    
end

colors = []
#網羅
for j in 0...$h
    for i in 0...$w
        #p "now(#{i}, #{j}): #{$grid[j][i]}"
        color = $grid[j][i]
        if color != "@" then
            struggle(i,j,color)
            colors.push(color)
        end
    end
end

#p colors

r = colors.count("R")
g = colors.count("G")
b = colors.count("B")

puts [r,g,b].join(" ")
