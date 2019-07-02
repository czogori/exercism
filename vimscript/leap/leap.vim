"
" This function takes a year and returns 1 if it's a leap year
" and 0 otherwise.
"
function! LeapYear(year) abort
    let year = a:year
    return (fmod(year, 4) == 0  && fmod(year, 100) != 0) || fmod(year, 400) == 0
endfunction
