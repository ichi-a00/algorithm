input_line = gets
$h = input_line.split[0].to_i
$w = input_line.split[1].to_i
$grid = []

#MAP
$grid[0] = Array.new($w+2, ".")
for j in 0...$h
    input_line = gets
    $grid[j+1] = input_line.chomp.chars
    $grid[j+1].push(".")
    $grid[j+1].unshift(".")
end
$grid[$h+1] = Array.new($w+2, ".")

#p $grid

#陸地を探る
def struggle(x, y)
    
    #p "now(#{x}, #{y})"
    
    $square += 1 
    
    #疑似浅瀬にする
    $grid[y][x] = "@"
    
    #上下左右を調べる
    for (next_x, next_y) in [[x-1, y], [x, y-1], [x+1, y], [x, y+1]]
    
        #端はスキップ
        if (next_x == 0 || next_x == $w+1 || next_y == 0 || next_y == $h+1) then
            $shore += 1
            next
        end
        
        #海はスキップ
        if $grid[next_y][next_x] == "." then
            $shore += 1
            next
        end

        #浅瀬はノーカン
        if $grid[next_y][next_x] == "@" then
            next
        end       
        
        
        #陸地なら再帰処理
        struggle(next_x, next_y)
    
    end
    
end


islands = []
#網羅
for j in 1..$h
    for i in 1..$w
        #p "now(#{i}, #{j}): #{$grid[j][i]}"
        if $grid[j][i] == "#" then
            $square = 0
            $shore = 0
            struggle(i,j)
            islands.push([$square, $shore])
        end
    end
end

#マルチsort
islands = islands.sort do |a, b|
  [b[0], b[1]] <=> [a[0], a[1]]
end

islands.each do |island|
    puts island.join(" ")
end
        
        
        
