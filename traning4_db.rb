require 'dbi'
$dbh = DBI.connect('DBI:SQLite3:traning4.db')

def hantei(score)
    case score
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
end
def sum_avg(select_avg_sum)
    $dbh.select_all("select #{select_avg_sum} from traning4_tbl") do |x|
        p x[0]
   end
end

sel = 0
while(sel != 6)
    puts "1:DB初期化"
    puts "2:登録"
    puts "3:科目ごとの合計・平均"
    puts "4:点数及び評価一覧"
    puts "5:教科ごとの上位5名"
    puts "6:終了"
    sel = gets.to_i
    case
        when sel == 1
            $dbh.do("DROP TABLE IF EXISTS traning4_tbl")
            $dbh.do(
                "CREATE TABLE traning4_tbl(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
                    name CHAR(20) NOT NULL,
                    score1 INTEGER NOT NULL,
                    score2 INTEGER NOT NULL)"
            )
        when sel == 2
            puts "名前を入力"
            shimei = gets.to_s.chomp
            puts "教科1の得点"
            score_1 = gets.to_i
            puts "教科2の得点"
            score_2 = gets.to_i
            $dbh.do("INSERT INTO traning4_tbl(name,score1,score2)
            VALUES(?,?,?)",shimei,score_1,score_2)
        when sel == 3
            puts "教科1の合計"
            sum_avg('sum(score1)')
            puts "教科2の合計"
            sum_avg('sum(score2)')
            puts "教科1の平均"
            sum_avg('avg(score1)')
            puts "教科2の平均"
            sum_avg('avg(score2)')
        when sel == 4
            puts "評価一覧"
            $dbh.select_all('select name,score1,score2 from traning4_tbl') do |st|
                    p "#{st[:name]}氏"
                    print "教科1：#{st[:score1]}点 "
                    hantei(st[:score1])
                    print "教科2：#{st[:score2]}点 "
                    hantei(st[:score2])
            end
        when sel == 5
            puts "教科ごとの上位5名"
            puts "教科1"
            $dbh.select_all('select name,score1 from traning4_tbl order by score1 desc limit 5') do |stu|
                p "#{stu[:name]}氏 : #{stu[:score1]}点"
            end
            puts "教科2"
            $dbh.select_all('select name,score2 from traning4_tbl order by score2 desc limit 5') do |stu|
                p "#{stu[:name]}氏 : #{stu[:score2]}点"
            end
    end
end