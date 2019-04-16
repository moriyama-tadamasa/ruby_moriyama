puts "初期値xを入力"
x = gets.to_i;
puts "初期値yを入力"
y = gets.to_i;

while (y != 0)
    ans = y;
    y = x % y;
    x = ans;
end
puts "最大公約数"
puts ans;