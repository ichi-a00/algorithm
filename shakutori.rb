input_line = gets
n = input_line.to_i
input_line = gets
x = input_line.split(" ")
calendar = x.map{|n| n.to_i}
#n = 21
#calendar = [1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,0,0,1]
#p calendar

safe_calendar = Array.new(n,0)

week = 7
dead_line = 6
shachiku_count = 0
right = 0
renzoku_max = 0
renzoku = 0
flag = 0

#連続出勤チェック開始
for left in 0...n
    #p "day: #{left}"
    #right = left
    
    #出勤すると社畜カウントが増える、過労死ラインを超えるとbreak
    while (right < n && shachiku_count + calendar[right] < dead_line) do
        shachiku_count += calendar[right]
        right += 1
    end
    
    #rightは許容できる限界の日付け
    #p right-left
    if right-left >= week then
        #最初を埋める
        if (renzoku==0) then
            renzoku += week-1
            flag = 1
        end
        renzoku += 1
    else
        renzoku = 0
    end
    
    renzoku_max = [renzoku_max, renzoku].max
    
    if (right == calendar.size && right-1-left < week)
        #残りを埋める
        if right-left >= week && flag == 0 then
            renzoku_max += week-1
        end
        
        break
    end
    
    #このifはいらんかも
    if right == left then
        right += 1
    else
        shachiku_count -= calendar[left]
    end
    #p renzoku_max
end

p renzoku_max
