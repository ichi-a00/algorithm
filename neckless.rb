# 自分の得意な言語で
# Let's チャレンジ！！
input_line = gets
n = input_line.split(" ")[0].to_i
c = input_line.split(" ")[1].to_i
k = input_line.split(" ")[2].to_i

pipes = []

for i in 0...n
    input_line = gets
    pipes.push([input_line.split(" ")[0].to_i, input_line.split(" ")[1].to_i])
end

#細い順に並べて、完全下位互換を削除
pipes.sort!
pipes.sort_by! {|x| [x[0], x[1]]}
#pipes.uniq! { |e| e.first }

#nn >= k maxで200000
nn = pipes.size

#k個とったときの最安がcを超えないかどうか
for i in 0...nn-k
    big_pipes = pipes[nn-k-i+1...pipes.size]
    big_pipes.sort_by! {|x| [x[1], -x[1]]}
    #p [pipes[nn-k-i], big_pipes]
    
    bg_sum = 0
    for j in 0...k-1
        bg_sum += big_pipes[j][1]
    end
    #p big_pipes[1]
    if pipes[nn-k-i][1]+bg_sum <= c then
        break
    end
end
    
#最小の組み合わせの中の最小がボトルネックのはず
p pipes[nn-k-i][0]
