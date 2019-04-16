def euclid(x,y)
    while (y != 0)
        ans = y
        y = x % y
        x = ans
    end
    return ans.to_s
end


print "初期値xを入力:"
x = gets.to_i

y = 0;
while(y == 0)
    print "0以外の値で初期値yを入力:"
    y = gets.to_i
end

puts "最大公約数:" + euclid(x,y)