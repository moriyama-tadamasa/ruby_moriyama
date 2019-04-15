1.upto(100){|n|
    puts n
    case
        when n%15 == 0 then
            puts ("FIZZBUZZ")
        when n%5 == 0 then
            puts ("BUZZ")
        when n%3 == 0 then
            puts ("FIZZ")
        else
    end
}
=begin
1.upto(100){|n|
    puts n
    if n%15 == 0 then
        puts ("FIZZBUZZ")
    elsif n%5 == 0
        puts ("BUZZ")
    elsif n%3 == 0
        puts ("FIZZ")
    end
}
=end