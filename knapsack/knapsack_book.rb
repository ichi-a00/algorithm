input_line = gets

n = input_line.split(" ")[0].to_i
m = input_line.split(" ")[1].to_i

books = []
dp = []

for i in 0...n
    input_line = gets
    books[i] = [input_line.split(" ")[0].to_i, input_line.split(" ")[1].to_i]
    dp[i] = Array.new(m+1, 0)
end

dp.push(Array.new(m, 0))


for i in 1..n
    for j in 0..m
    
        page = books[i-1][0]
        day = books[i-1][1]
        
        #日数不足で選べない
        if j < day then
            dp[i][j] = dp[i-1][j]
            next
        end
        
        #p "#{i}, #{j}, #{page}, #{day}"
        
        #本を選ぶ
        read_book = dp[i-1][j-day] + page
        #選ばない
        unread_book = dp[i-1][j]
        
        #その日まででページの大きい方を選択
        dp[i][j] = [read_book, unread_book].max
        
    end
end

p dp.max.max
