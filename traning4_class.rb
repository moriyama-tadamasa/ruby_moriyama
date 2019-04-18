#１０人分のテスト成績を管理する
=begin
n人目の氏名を入力してください：〜〜
n人目の国語の点数を入力してください：〜〜
n人目の数学の点数を入力してください：〜〜
・１教科ごとの合計点
国語：〜〜
数学：〜〜
・１教科ごとの平均点
国語：〜〜
数学：〜〜
・評価一覧
A氏
国語：〜〜　良
数学：〜〜　可

・教科ごとの上位５名
国語
B氏　〜〜点
=end
class Shiken
    attr_accessor :name, :kokugo_score, :math_score
    def initialize(name,kokugo_score,math_score)
        @name = name
        @kokugo_score = kokugo_score
        @math_score = math_score
    end
end

n=10
ary = []

0.upto(n-1) do |i|
    print "氏名を入力してください："
    shimei = gets.to_s.chomp
    print "#{shimei}の国語の点数を入力してください："
    ko_score = gets.to_i
    exit if(ko_score<0 || ko_score>100)
    print "#{shimei}の数学の点数を入力してください："
    mth_score = gets.to_i
    exit if(mth_score<0 || mth_score>100)
    ary << Shiken.new(shimei,ko_score,mth_score)
end

sum_kokugo_score = 0;
sum_math_score = 0;

ary.each do |tes|
    sum_kokugo_score += tes.kokugo_score
    sum_math_score += tes.math_score
end

puts "・１教科ごとの合計点"
puts "国語：#{sum_kokugo_score}"
puts "数学：#{sum_math_score}"
puts "・１教科ごとの平均点"
puts "国語：#{sum_kokugo_score/n}"
puts "数学：#{sum_math_score/n}"

ary.each{|stu|
    puts "#{stu.name}氏"
    print "国語：#{stu.kokugo_score}点 "
    case stu.kokugo_score
        when 80..100 then
            puts "評価：優"
        when 60..79 then
            puts "評価：良"
        when 40..59 then
            puts "評価：可"
        when 0..39 then
            puts "評価：不可"
        else
            puts "評価：評価規格外"
    end
    print "数学：#{stu.math_score}点 "
    case stu.math_score
        when 80..100 then
            puts "評価：優"
        when 60..79 then
            puts "評価：良"
        when 40..59 then
            puts "評価：可"
        when 0..39 then
            puts "評価：不可"
        else
            puts "評価：評価規格外"
    end
}