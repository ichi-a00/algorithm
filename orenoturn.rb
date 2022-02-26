input_line = gets.to_i
$n = input_line

input_line = gets
k = [input_line.split(" ")[0].to_i, input_line.split(" ")[1].to_i]

input_line = gets
c = [input_line.split(" ")[0].to_i, input_line.split(" ")[1].to_i]

count = 0

while 0 do
    
    #p "俺のターン #{k}"
    d = [[k[0]-1,k[1]-1], [k[0],k[1]-1], [k[0]+1,k[1]-1],
        [k[0]-1,k[1]], [k[0]+1,k[1]],
        [k[0]-1,k[1]+1], [k[0],k[1]+1], [k[0]+1,k[1]+1]]
    
    min_dist = $n+1
    tmp_dist = $n*2+1
    
    for (next_x, next_y) in d
    
        if next_x < 0 || next_x >= $n || next_y < 0 || next_y >= $n then
            next
        end
        
        #p [next_x, next_y]
        
        #○と△の距離ななめも考慮
        x_dist = next_x-c[0]
        y_dist = next_y-c[1]
        
        if x_dist.abs==y_dist.abs then
            dist = x_dist.abs
        else
            dist = [x_dist.abs, y_dist.abs].max
        end
        
        if dist < min_dist then
            tmp_k = [next_x, next_y]
            min_dist = dist
            tmp_dist = x_dist.abs+y_dist.abs
        elsif dist == min_dist then
            if (x_dist.abs+y_dist.abs) < tmp_dist then
                tmp_k = [next_x, next_y]
                tmp_dist = x_dist.abs+y_dist.abs
            end
        end
    
    end
    
    k = tmp_k
    #p "俺はターンエンド #{k}"
    
    count += 1
    
    if k == c then
        break
    end
    
    #p "お前のターン #{c}"
    d = [[c[0]-1,c[1]-1],[c[0]+1,c[1]-1],[c[0]-1,c[1]+1],[c[0]+1,c[1]+1]]
    
    max_dist = 0
    tmp_dist = 0
    
    for (next_x, next_y) in d
        if next_x < 0 || next_x >= $n || next_y < 0 || next_y >= $n then
            next
        end
        
        x_dist = next_x-k[0]
        y_dist = next_y-k[1]
        
        if x_dist.abs==y_dist.abs then
            dist = x_dist.abs
        else
            dist = [x_dist.abs, y_dist.abs].max
        end
        
        if dist > max_dist then
            tmp_c = [next_x, next_y]
            max_dist = dist
            tmp_dist = x_dist.abs+y_dist.abs
        elsif dist == max_dist then
            if (x_dist.abs+y_dist.abs) > tmp_dist then
                tmp_c = [next_x, next_y]
                tmp_dist = x_dist.abs+y_dist.abs
            end
        end
    
    end
    c = tmp_c
    #p "お前もエンド #{c}"
    
end

p count
