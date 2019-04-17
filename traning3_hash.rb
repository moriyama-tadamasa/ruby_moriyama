puts "文字列を入力"
ans = gets.to_s.chomp
hash1 = Hash.new

ans.each_char{|chr|
    if(hash1.include?(chr))
        hash1[chr] += 1
    else
        hash1[chr] = 1
    end
    puts hash1
}

max_count = 0
hash1.each {|chr,cnt|
    max_count = cnt if(cnt > max_count)
}
p "最も出現頻度が高いのは"
hash1.each {|chr,cnt|
    p chr if(cnt == max_count)
}