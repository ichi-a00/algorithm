input_line = gets
n = input_line.split(" ")[0].to_i
x = input_line.split(" ")[1].to_i

#dp配列を作成、dp[0][w]を初期化
dp = Array.new(n+1).map{Array.new(x,0)}

kingyo = []

for i in 0...n
    input_line = gets
    w = input_line.split(" ")[0].to_i
    r = input_line.split(" ")[1].to_i
    kingyo[i] = {"w"=> w, "r"=>r}
end

#p kingyo

#MAP
for i in 1..n
    for j in 0...x
        #p "i, j = #{i}, #{j}"
        #p kingyo[i-1]["w"]
        if (kingyo[i-1]["w"] > j) then
            #すくわない　というかすくえない
            dp[i][j] = dp[i-1][j]
        else
            #すくう
            fish = dp[i-1][j-kingyo[i-1]["w"]]+kingyo[i-1]["r"]
            #すくわない
            not_fish = dp[i-1][j]
            
            #p "fish: #{fish}"
            #すくったほうがよければ更新
            dp[i][j] = [fish, not_fish].max
        end
    end
end

p dp.max.max
