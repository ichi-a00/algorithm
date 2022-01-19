input_line = gets
n = input_line.split(" ")[0].to_i
x = input_line.split(" ")[1].to_i

#dp配列　i個目までで合計金額jにできる？ True/False を作成、dp[0][j]を初期化
dp = Array.new(n+1).map{Array.new(x+1,false)}
dp[0][0] = true

#何個買ってるか
dp_count = Array.new(n+1) {Array.new(x+1,0)}

okashi = []

for i in 0...n
    input_line = gets
    okashi[i] = input_line.to_i
end

max_n=0
max_j=0

#MAP
for i in 1..n
    for j in 0..x
        #p "i, j = #{i}, #{j}"
        
        if (okashi[i-1] > j) then
            #かえない
            dp[i][j] = dp[i-1][j]
            dp_count[i][j] = dp_count[i-1][j]
        else
            #i個目までで合計金額jにできる？ True/False
            dp[i][j] = dp[i-1][j-okashi[i-1]] || dp[i-1][j]
            
            #買うとできるとき
            if dp[i-1][j-okashi[i-1]] then
                dp_count[i][j] = dp_count[i-1][j-okashi[i-1]]
                dp_count[i][j] += 1
                #p "i, j = #{i}, #{j}"
                #p dp_count[i][j]
            else
                #買わなければできるとき か　そもそもできないとき
                dp_count[i][j] = dp_count[i-1][j]
            end
        end
        #最大種類数とその時の合計金額を更新
        if max_n <= dp_count[i][j] then
            max_n = dp_count[i][j]
            max_j = j
        end
    end
end

p x-max_j
