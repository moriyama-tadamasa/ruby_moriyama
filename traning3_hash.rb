puts "文字列を入力"
ans = gets.to_s.chomp
hash1 = Hash.new

a=1
ans.each_char{|chr|
    if(hash1.include?(chr))
        hash1[chr] += a
    else
        hash1[chr] = 1
    end
    puts hash1
}

max_count = 0
max_chr = ""
hash1.each{|chr,cnt|
    if(cnt > max_count) then
        max_chr = chr
        max_count = cnt
    end
}

hash1.each{|chr,cnt|
    if(cnt == max_count) then
        p max_chr = chr
    end
}