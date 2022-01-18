input_line = gets
n = input_line.split(" ")[0].to_i
x = input_line.split(" ")[1].to_i

#dp配列を作成、dp[0][n]を初期化
dp = Array.new(n+1).map{Array.new(n+1,x+1)}
dp2 = Array.new(n+1).map{[]}
okashi = []

for i in 0...n
    input_line = gets
    price = input_line.to_i
    okashi[i] = price
    dp[i][0] = 0
end

#okashi.sort
tmp = []

#MAP
for i in 1..n
    dp2 = tmp
    for j in 0..n
        #p "i, j = #{i}, #{j}"
        #p okashi[i-1]["w"]
        if (1 > j) then
            #すくわない　というかすくえない
            dp[i][j] = dp[i-1][j]
        else
            #すくう
            buy = dp[i-1][j-1]+okashi[i-1]
            
            #すくわない
            not_buy = dp[i-1][j]
            
            #p "fish: #{fish}"
            #すくったほうがよければ更新
            dp[i][j] = [buy, not_buy].min
            

            if buy<not_buy then
                tmp.push(i)
                #p "#{i}, #{j}"
            end
        end
    end
end

max_n = -1
min_price = 0

#最大種類数と最小値段がとりあえずこれでわかる
dp.min.each do |dp|
    if dp-x < 0 then
        max_n += 1
        min_price = dp
    end
end

#p max_n

p dp2
