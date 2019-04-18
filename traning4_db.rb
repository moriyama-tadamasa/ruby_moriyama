require 'dbi'
dbh = DBI.connect('DBI:SQLite3:traning4.db')
sel = 0
while(sel != 9)
    puts "1:DB初期化"
    puts "2:登録"
    puts "3:科目ごとの合計・平均"
    puts "4:点数及び評価一覧"
    sel = gets.to_i
    case
        when sel == 1
            dbh.do("DROP TABLE IF EXISTS traning4_tbl")
            dbh.do(
                "CREATE TABLE traning4_tbl(
                    name CHAR(20) NOT NULL,
                    score1 INT NOT NULL,
                    score2 INT NOT NULL)"
            )
        when sel == 2
            puts "名前を入力"
            shimei = gets.to_s
            puts "教科1の得点"
            score_1 = gets.to_i
            puts "教科2の得点"
            score_2 = gets.to_i
            dbh.do("INSERT INTO traning4_tbl(name,score1,score2)
            VALUES(?,?,?)",shimei,score_1,score_2)
        when sel == 3
            sum1 = 0
            puts "教科1の合計"
            dbh.select_all('select score1 from traning4_tbl') do |x|
                sum1 += x[:score1]
            end
            p sum1
            sum2 = 0
            puts "教科2の合計"
            dbh.select_all('select score2 from traning4_tbl') do |x|
                sum2 += x[:score2]
            end
            p sum2
            puts "教科1の合計"
            
        end
    end