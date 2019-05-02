module Leap

let leapYear (year: int): bool =
    let dividable num = year % num = 0
    dividable 4 && not (dividable 100) || dividable 400