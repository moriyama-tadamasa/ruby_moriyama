1.upto(100){|n|
    case
        when n%3 == 0 then
            puts n
            puts ("FIZZ")
        when n%5 == 0 then
            puts n
            puts ("BUZZ")
        when n%15 == 0 then
            puts n
            puts ("FIZZBUZZ")
        else
    end
}