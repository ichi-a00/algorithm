input_line = gets
n = input_line.to_i
input_line = gets
a = input_line.split(" ")[0].to_i
b = input_line.split(" ")[1].to_i

count = 0

nda = n/a
ndb = n/b

gcd = a.gcd(b)

#踏める段を記録するはいれつ
step = []

#MAP 対称性を利用して見る範囲を省いてる
for i in 0..a+b
    for j in 0..ndb
        if (a*i+b*j < n && a*i+b*j>0) then
            step.push(a*i+b*j)
        end
    end
end

for i in (nda-a)..nda
    if i < 0 then
        next
    end
    for j in 0..ndb
        if j < 0 then
            next
        end
        if (a*i+b*j < n && a*i+b*j>0) then
            step.push(a*i+b*j)
        end
    end
end



step = step.uniq
#step = step.sort
#step.shift

p n-step.size-1
#p step

#やばい　こんな事する必要なかった
# for k in 1...n
#     flag = 0
#     roop = 0
#     if (k % a == 0 || k % b == 0) then
#         # p "Aとばした #{k}"
#         count += 1
#         next
#     end
    
#     #最大公約数の倍数以外は飛ばしてOK。a以下も飛ばす。
#     if (b % a == 0 || k % gcd != 0 || k < a) then
#         # p "Bとばして除外 #{k}"
#         next
#     else
# ###
#     end
    

#     if flag == 1 then
#             #p "Cとばさなかった#{k}, roop:#{roop}"
#         count += 1
#     else
#          #p "Dとばさない除外#{k}, roop:#{roop}"
#     end
# end

#p n-count-1

