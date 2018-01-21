-module(collatz_conjecture).

-export([steps/1, test_version/0]).

steps(N) when N =< 0 -> {error, "Only strictly positive numbers are allowed"};
steps(N) -> steps(N, 0).
steps(1, S) -> S;
steps(N, S) when N rem 2 == 0 -> steps(N div 2, S + 1);
steps(N, S) -> steps(N * 3 + 1, S + 1).

test_version() ->
  1.
