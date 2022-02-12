n = gets.to_i
input_line = gets
cf = input_line.split(" ")[0].to_i
cb = input_line.split(" ")[1].to_i

input_line = gets
safety = input_line.chomp.split("")

to_visit = []

for i in 1...n
    to_visit.push(i)
end

for i in 0...n
    case safety[i]
    when "s" then
        safety[i] = 1
    when "d" then
        safety[i] = -1
    end
end

epochs = to_visit.permutation.to_a

#epochs = [[1, 3, 4, 2]]

max_cost = Float::INFINITY

route = []
tmp_safety = []
    
epochs.each do |epoch|
    tmp = n
    cost = 0
    for k in 0...n
        tmp_safety[k] = safety[k]
    end
    
    #p epoch
    
    epoch.each do |e|
        #p "now: #{tmp}, to: #{e}"
        #p tmp_safety
        #tmp=行き元、e=行き先
        if tmp_safety[e-1] == -1 then
            cost = Float::INFINITY
            break
        else
            if tmp > e then
                #遡行
                cost += cb
            else
                #未来
                cost += cf
            end
        end
        
        #安全化を入れ替える
        for j in e...n
            tmp_safety[j] *= -1
        end
        
        tmp = e
    end
    
    #最後にback to the futureできるか
    if tmp_safety[n-1] == -1 then
        max_ex_cost = Float::INFINITY
        for i in 1..n-1
            ex_cost = 0
            if i != tmp && tmp_safety[i-1] == 1 then
                if i < tmp then
                    ex_cost += cb
                else
                    ex_cost += cf
                end
            end
            
            if max_ex_cost > cost then
                max_ex_cost = ex_cost
                ex_epoch = i
            end
        end
        
        cost += max_ex_cost
        epoch.push(ex_epoch)
    end
    
    #p cost
    
    if max_cost > cost then
        max_cost = cost
        route = epoch
    end
end

puts [n, route, n].flatten.join(" ")
