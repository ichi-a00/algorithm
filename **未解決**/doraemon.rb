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

epochs = []

#xor
if (n % 2 == 0) ^ (safety[n-1] == 1) then
    #tf || ft　寄り道なし
    epochs = to_visit.permutation.to_a
else
    #tt || ff　どこかに寄り道しないと戻れない
    for i in 1...n
        to_visit.push(i)
        epochs += to_visit.permutation.to_a
        to_visit.pop
    end
end

#p epochs
max_cost = Float::INFINITY

tmp_safety = []
route = []
    
epochs.each do |epoch|

    tmp = n
    cost = 0
    for k in 0...n
        tmp_safety[k] = safety[k]
    end
    
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
            elsif tmp < e then
                #未来
                cost += cf
            else
                cost = Float::INFINITY
                break
            end
        end
        
        #安全化を入れ替える
        for j in e...n
            tmp_safety[j] *= -1
        end
        
        tmp = e
    end
    
    if max_cost > cost then
        max_cost = cost
        route = epoch
    end
    
    #p epoch
    #p cost

end

puts [n, route, n].flatten.join(" ")
