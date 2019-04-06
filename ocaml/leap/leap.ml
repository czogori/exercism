let leap_year year =
    let dividable num = year mod num == 0 in
    dividable 4 && not (dividable 100) || dividable 400
