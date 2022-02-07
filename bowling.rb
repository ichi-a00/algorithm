input_line = gets
a = input_line.split(" ")[0].to_i
b = input_line.split(" ")[1].to_i
n = input_line.split(" ")[2].to_i
input_line = gets
pin = input_line.split(" ")

flame_score = []
total_score = 0

i = 0
#後ろから計算したほうが良さげ
while flame_score.size < a do
    first = pin[i].to_i
    second = pin[i+1].to_i
    third = pin[i+2].to_i
    
    #最終フレームだけ特殊
    if flame_score.size == a-1 then
        #strike
        if first == b then
            #strike double
            if second == b then
                flame_score.push(first+second+second+third+third+third)
            else
            #10-1-3
                flame_score.push(first+second+second+third+third)
            end
        #spareで3頭目
        elsif first+second == b then
            flame_score.push(first+second+third+third)
        #2投げで終わり
        else
            flame_score.push(first+second)
        end
    else
        #strike
        if first == b then
            flame_score.push(first+second+third)
            i += 1
        #spare
        elsif first+second == b then
            flame_score.push(first+second+third)
            i += 2
        #それ以外
        else
            flame_score.push(first+second)
            i += 2
        end
    end
end

p flame_score.sum
