input_line = gets
$h = input_line.split[0].to_i
$w = input_line.split[1].to_i
$grid = []

#MAP
for j in 0...$h
    input_line = gets
    $grid[j] = input_line.chomp.chars
    $grid[j].push("#")
end

#p $grid

#たてに連続した通路数を記録
for i in 0..$w
    count = 0
    for j in 0...$h
        case $grid[j][i]
        when "#" then
            $grid[j][i] = 0
            count = 0
        else
            count += 1
            $grid[j][i] = count
        end
    end
end

grand_max_square = 0

#1行ずつ取り出して、横に進めてその時点での最大面積を記録
for j in 0...$h
    stack = []
    max_square = 0
    for i in 0..$w
        square = 0
        if stack == [] then
            stack.push([$grid[j][i], i])
        else
            if $grid[j][i] > stack.last[0] then
                stack.push([$grid[j][i], i])
            elsif $grid[j][i] < stack.last[0] then
                while (stack != [] && $grid[j][i] < stack.last[0]) do
                    tmp = stack.pop
                    square = tmp[0]*(i-tmp[1])
                    max_square = [square, max_square].max
                end
                stack.push([$grid[j][i], tmp[1]])
            end
        end
        #p "i:#{i}, #{square}"
    end
    #p "J:#{j},,, #{max_square}"
    grand_max_square = [max_square, grand_max_square].max
end

p grand_max_square

# $grid.each do |grid|
#     puts grid.join("")
# end
