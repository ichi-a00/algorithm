input_line = gets
$n = input_line.split[0].to_i
$m = input_line.split[1].to_i
$grid = []
sixtones = []
$tmp_arr = []

#MAP
for j in 0...$n
    input_line = gets
    $grid[j] = input_line.chomp.chars
end

for k in 0...$m
    input_line = gets
    sixtones[k] = [input_line.split[0].to_i, input_line.split[1].to_i]
end

#p $stone

#方向で次の座標を示す
def next_direction(x, y, direction)
    case direction
    when 1 then
        next_x = x-1
        next_y = y-1
    when 2 then
        next_x = x
        next_y = y-1
    when 3 then
        next_x = x+1
        next_y = y-1
    when 4 then
        next_x = x-1
        next_y = y
    when 5 then
        #erorr
        next_x = x
        next_y = y
    when 6 then
        next_x = x+1
        next_y = y
    when 7 then
        next_x = x-1
        next_y = y+1
    when 8 then
        next_x = x
        next_y = y+1
    when 9 then
        next_x = x+1
        next_y = y+1
    end
    return next_x, next_y
end


#1方向だけ色を探る
def struggle(x, y, color, direction)
    
    #p "now(#{x}, #{y})"
    
    #置いたところをその色にしたいけど、保留
    #$grid[y][x] = color
    

    next_x, next_y = next_direction(x, y, direction)
    
    #端でそのままおわり
    if (next_x < 0 || next_x >= $n || next_y < 0 || next_y >= $n) then
        return
    end
    
    #何も置いてないとこはそのままおわり
    if $grid[next_y][next_x] == "." then
        return
    end    
    
    #同じ色でひっくり返して終わり
    if $grid[next_y][next_x] == color then
        #ひっくりかえす
        $tmp_arr.each do |tmp|
            $grid[tmp[1]][tmp[0]] = color
        end
        return
    end
    
    #無限ループ回避用
    if (next_x == x && next_y == y) then
        return
    end
    
    #違う色ならひっくり返す候補にして再帰処理
    $tmp_arr.push([next_x, next_y])
    struggle(next_x, next_y, color, direction)
end

#網羅
sixtones.each_with_index do |stone, k|
    x = stone[0]-1
    y = stone[1]-1
    
    #R->G->B->R...
    case k%3
    when 0 then
        color="R"
    when 1 then
        color="G"
    when 2 then
        color="B"
    end
    
    for k in 1..9
        $tmp_arr = []
        struggle(x, y, color, k)
        $grid[y][x] = color
    end
end


colors = [0,0,0]

#盤面整理
$grid.each do |grid|
    puts grid.join("")
    colors[0] += grid.count("R")
    colors[1] += grid.count("G")
    colors[2] += grid.count("B")
end

R = colors[0]
G = colors[1]
B = colors[2]

# 勝敗判定　と引き分け時の処理 m%3=0->B, 1->R, 2->G
if (R > G && R > B) then
    puts "R"
elsif (G > R && G > B) then
    puts "G"
elsif (B > R && B > G) then
    puts "B"
else
    if (R == G && R > B) then
        case $m%3
        when 0 then
            puts "G"
        when 1 then
            puts "R"
        when 2 then
            puts "G"
        end
    elsif (R == B && R > G) then
        case $m%3
        when 0 then
            puts "B"
        when 1 then
            puts "R"
        when 2 then
            puts "R"
        end
    elsif (G == B && G > R) then
        case $m%3
        when 0 then
            puts "B"
        when 1 then
            puts "B"
        when 2 then
            puts "G"
        end
    else
        #R=G=B
        case $m%3
        when 0 then
            puts "B"
        when 1 then
            puts "R"
        when 2 then
            puts "G"
        end
    end
end
