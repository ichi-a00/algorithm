input_line = gets
$h = input_line.split[0].to_i
$w = input_line.split[1].to_i
$grid = [$h]
$gridscore = []

#p $gridscore

#MAP
for j in 0...$h
    input_line = gets
    $grid[j] = input_line.split(" ")
    $gridscore[j] = []
    #p $grid[j]
end

for i in 0...$w
    $gridscore[0][i] = $grid[0][i].to_i
end

#メモ化探索
def struggle(i, j)
    #p $grid[j][i]
    #p "[#{i}, #{j}], #{$grid[j][i]}点"
    
    # if (j >= $h-1) then
    #     p "end of point"
    #     #$gridscore[j][i] = score
    #     #p "EOP gridscore[#{i}][#{j}] = #{$gridscore[j][i]}"
    #     return 1
    # end
    
    #p "gridscore[#{i}][#{j}] = #{$gridscore[j][i]}"
    
    score = $gridscore[j][i]

    #下3つを探る
    for (x, y) in [[i-1, j+1], [i, j+1], [i+1, j+1]]

        if (x < 0 || x >= $w) then
            #p "OUT OF RANGE"
            next
        end
        
        node_score = $grid[y][x].to_i
        
        #この再帰が違った
        #total_score = struggle(x, y, score)
        
        #もしここまでの点が調べてあったらそれを引用&比較して再帰回避
        if $gridscore[y][x] then
            #p "回避"
            if score + node_score > $gridscore[y][x] then
                $gridscore[y][x] = score + node_score
                #p "gridscore[#{i}][#{j}] = #{$gridscore[j][i]}"
            end
        else
            $gridscore[y][x] = score + node_score
        end
    
    end
    
    return 1
end

for j in 0...$h-1
    for i in 0...$w
        #p "@@@@@@#{i}@@@@@@"
        struggle(i,j)
    end
end

p $gridscore[$h-1].max
#p $high_score
