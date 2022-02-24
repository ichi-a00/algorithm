input_line = gets
n = input_line.to_i

questions = []
dp = []


dp[0] = Array.new(101, 0)

for i in 0...n
    input_line = gets
    questions[i] = input_line.to_i
    dp[i+1] = Array.new(101, 0)
end

for i in 1..n
    for j in 0..100
        if questions[i-1] > j then
            dp[i][j] = dp[i-1][j]
            next
        end
        
        corr = dp[i-1][j-questions[i-1]] + questions[i-1]
        incorr = dp[i-1][j]
        
        dp[i][j] = [corr, incorr].max
        
    end
end

# dp.each do |d|
#     p d
# end
p dp.max.uniq.size

dp.max.uniq.each do |d|
    p d
end
