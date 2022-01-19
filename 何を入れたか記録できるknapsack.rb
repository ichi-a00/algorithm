input_line = gets
n = input_line.split(" ")[0].to_i
x = input_line.split(" ")[1].to_i

n = 4
x = 10

#dp配列を作成、dp[0][w]を初期化
dp = Array.new(n+1).map{Array.new(x,0)}

kingyo = [[2,7],[7,1],[2,9],[4,7]]

# for i in 0...n
#     input_line = gets
#     w = input_line.split(" ")[0].to_i
#     r = input_line.split(" ")[1].to_i
#     kingyo[i] = {"w"=> w, "r"=>r}
# end

#p kingyo

#fish_list = Array.new(n+1).map{Array.new(x,[])} これだと同じオブジェクトを参照してしまう※よくある間違いらしい
fish_list = Array.new(n+1) { Array.new(x) { Array.new()} }

#MAP
for i in 1..n
    for j in 0...x
        #p "i, j = #{i}, #{j}"
        #p kingyo[i-1]["w"]
        if (kingyo[i-1][0] > j) then
            #すくわない　というかすくえない
            dp[i][j] = dp[i-1][j]
            fish_list[i][j] += fish_list[i-1][j]
        else
            #すくう
            fish = dp[i-1][j-kingyo[i-1][0]]+kingyo[i-1][1]
            #すくわない
            not_fish = dp[i-1][j]
            
            #p "fish: #{fish}"
            #すくったほうがよければ更新
            dp[i][j] = [fish, not_fish].max
            
            if fish>not_fish then
                fish_list[i][j] += fish_list[i-1][j-kingyo[i-1][0]]
                if !fish_list.include?(i) then
                    fish_list[i][j].push(i)
                    #p "i, j = #{i}, #{j}"
                end
            else
                fish_list[i][j] += fish_list[i-1][j]
            end
        
        end
    end
end

p dp.max.max
p fish_list
