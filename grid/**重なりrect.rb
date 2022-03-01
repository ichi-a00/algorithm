input_line = gets

n=input_line.split[0].to_i
m=input_line.split[1].to_i
s=input_line.split[2].to_i

grid = []

for i in 0...n
    input_line = gets
    grid[i] = input_line.chomp.split("")
    grid[i].map!{|x| x.to_i}
end

colors = []
left_colors = []

for i in 1..s
    left_colors.push(i)
end

#最初だけ
for k in 0...s
    break_flag = false
    for y in 0...n-m+1
        for x in 0...n-m+1
            #p [x, y]
            unless grid[y][x] == 0 then
                vertex = [grid[y][x]]
                for j in y...y+m
                    for i in x...x+m
                        vertex.push(grid[j][i])
                    end
                end
                
                vertex.delete("#")
                if vertex.uniq.size == 1 then
                    #p vertex
                    if vertex[0] == 0 then
                        next
                    end
                    if y < n-m && x < n-m && (grid[y+m][x] == vertex[0] || grid[y][x+m] == vertex[0] || grid[y+m-1][x+m] == vertex[0] || grid[y+m][x+m-1] == vertex[0]) then
                        next
                    end
                    #p [grid[y][x], x+1, y+1]
                    colors.push([vertex[0], x+1, y+1])
                    left_colors.delete(vertex[0])
                    
                    grid[y][x] = "#"
                    for j in y...y+m
                        for i in x...x+m
                            grid[j][i] = "#"
                        end
                    end
                    
                    break_flag = true
                    break
                end
            end
        end
        break if break_flag
    end
    
    # grid.each do |g|
    #     puts g.join("")
    # end
    
    # p "-------------------------"

end

left_colors.each do |l|
    colors.push([l, colors.last[1], colors.last[2]])
end

colors.reverse!

colors.each do |c|
    puts c.join(" ")
end
