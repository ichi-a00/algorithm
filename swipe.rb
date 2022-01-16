input_line = gets
n = input_line.to_i

grid = []
arrow_ud = []
arrow_lr = []
arrow_uldr = []
arrow_urdl = []
#p grid

#MAP
for j in 0...n
    input_line = gets
    x = input_line.chomp.chars
    grid[j] = x.map{|n| n.to_i}
    #p grid
    arrow_ud[j] = Array.new(n,0)
    arrow_lr[j] = Array.new(n,0)
    arrow_uldr[j] = Array.new(n,0)
    arrow_urdl[j] = Array.new(n,0)
    
    for i in 0...n
        #p "grid[#{j}][#{i}]"
        
        #上をしらべる
        if j>0 then
            case grid[j][i]-grid[j-1][i]
            when 1 then
                if arrow_ud[j-1][i]>=0 then
                    arrow_ud[j][i] = arrow_ud[j-1][i] + 1
                else
                    arrow_ud[j][i] = 1
                end
            when -1 then
                if arrow_ud[j-1][i]<=0 then
                    arrow_ud[j][i] = arrow_ud[j-1][i] - 1
                else
                    arrow_ud[j][i] = -1
                end
            else
                arrow_ud[j][i] = 0              
            end
        end
        
        #左をしらべる
        if i>0 then
            case grid[j][i]-grid[j][i-1]
            when 1 then
                if arrow_lr[j][i-1]>=0 then
                    arrow_lr[j][i] = arrow_lr[j][i-1] + 1
                else
                    arrow_lr[j][i] = 1
                end
            when -1 then
                if arrow_lr[j][i-1]<=0 then
                    arrow_lr[j][i] = arrow_lr[j][i-1] - 1
                else
                    arrow_lr[j][i] = -1
                end
            else
                arrow_lr[j][i] = 0              
            end
        end
        
        #左上
        if j>0 && i>0 then
            case grid[j][i]-grid[j-1][i-1]
            when 1 then
                if arrow_uldr[j-1][i-1]>=0 then
                    arrow_uldr[j][i] = arrow_uldr[j-1][i-1] + 1
                else
                    arrow_uldr[j][i] = 1
                end
            when -1 then
                if arrow_uldr[j-1][i-1]<=0 then
                    arrow_uldr[j][i] = arrow_uldr[j-1][i-1] - 1
                else
                    arrow_uldr[j][i] = -1
                end
            else
                arrow_uldr[j][i] = 0              
            end           
        end
        
        #右上
        if j>0 && i<n-1 then
            case grid[j][i]-grid[j-1][i+1]
            when 1 then
                if arrow_urdl[j-1][i+1]>=0 then
                    arrow_urdl[j][i] = arrow_urdl[j-1][i+1] + 1
                else
                    arrow_urdl[j][i] = 1
                end
            when -1 then
                if arrow_urdl[j-1][i+1]<=0 then
                    arrow_urdl[j][i] = arrow_urdl[j-1][i+1] - 1
                else
                    arrow_urdl[j][i] = -1
                end
            else
                arrow_urdl[j][i] = 0              
            end            
        end
    end
end

#CHECK
max_move = 0
for j in 0...n
    max_move = [max_move, [[arrow_uldr[j].max, arrow_urdl[j].max, arrow_lr[j].max, arrow_ud[j].max].max, [arrow_uldr[j].min, arrow_urdl[j].min, arrow_lr[j].min, arrow_ud[j].min].min.abs].max].max 
    #p arrow_ud[j]
end

p max_move+1

