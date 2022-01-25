input_line = gets
access = input_line.chomp.chars

#アルファベットハッシュさん
$az = Hash[[*'a'..'z'].map{|val| [val, 0]}]

#アルファベットとかっこ区切り
access= input_line.chomp.split(/([a-z()])/).reject(&:empty?)

count = 1
dim = 0
multi = []

access.each do |tmp|
    #p [tmp,count,dim,multi]
    
    #アルファベットなら追加。直前の数字は精算。
    if tmp =~ /[a-z]/ then
        if dim==0 then
            #p [tmp, count]
            $az[tmp] += count
            count = 1
        else
            tmp_count = 1
            unless multi[dim] then
                multi[dim] = 1
            end
            for i in 0..dim
                tmp_count *= multi[i]
            end
            $az[tmp] += tmp_count
            multi[dim] = 1
        end
    end
    
    #数字ならcountを進めて次へ
    if tmp =~ /[0-9]/ then
        count = tmp.to_i
        unless dim==0 then
            multi[dim] = tmp.to_i
        end
    end
    
    #かっこ始まりなら、かっこ前の数字を記録しつつ次元を上げる
    if tmp == "(" then
        multi[dim] = count
        dim += 1
    end
    
    #かっこ終わりは、次元を下げてかっこ前の数字分の精算
    if tmp == ")" then
        #p [")", count, dim, multi]
        dim -= 1
        count /= multi[dim]
        multi[dim] =1
        if dim == 0 then
            count = 1
        end
    end
    
end

$az.each do |az|
    puts az.join(" ")
end
