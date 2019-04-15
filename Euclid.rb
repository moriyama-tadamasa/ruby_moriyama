puts "大きい方の初期値を入力"
big = gets.to_i
puts "小さい方の初期値を入力"
small = gets.to_i

while (1)
    ans = small;
    small = big%small;
    big = ans;
    break if small == 0
end
p "最大公約数は"
puts ans