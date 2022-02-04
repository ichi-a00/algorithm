n = gets.to_i
w = []
dp = []

for i in 0...n
    w[i] = gets.to_i
    dp[i] = []
end

m = gets.to_i

#trucks = [[容量,コスト], ...]
trucks = [] 

for j in 0...m
    input_line = gets
    trucks[j] = [input_line.split(" ")[0].to_i, input_line.split(" ")[1].to_i] 
end

#----map----


#----dp-----

for i in 0...n
    
    #初期化　トラックを用意
    if i == 0 then
        for j in 0...m
            if trucks[j][0]-w[i] >= 0 then
                dp[i].push([trucks[j][1], trucks[j][0]-w[i]])
            end
        end
        next
    end
    
    dp[i-1].each do |d|
        #d = [コスト, 余り]
        #余りでいけるか？
        if d[1]-w[i] >= 0 then
            #いける場合、コストそのままで余りを減らす
            dp[i].push([d[0], d[1]-w[i]])
        else
            #行けない場合、次のトラックを用意
            for j in 0...m
                if trucks[j][0]-w[i] >= 0 then
                    dp[i].push([d[0]+trucks[j][1], trucks[j][0]-w[i]])
                end
            end
        end
    end
    
    #重複と完全下位互換を削除 これでだいぶ削れるはず
    dp[i].uniq!
    dp[i].sort_by! {|x| [x[0], -x[1]]}
    dp[i].uniq! { |e| e.first }
    #p dp[i]
    
end

p dp[n-1].min[0]

# dp.each do |d|
#     p d.size
# end
