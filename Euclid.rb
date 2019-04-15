puts "大きい方の初期値を入力"
big = gets.to_i
puts "小さい方の初期値を入力"
small = gets.to_i

while (small != 0)
    ans = small;
    small = big%small;
    big = ans;
end
p "最大公約数"
puts ans