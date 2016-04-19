\ collcount.fs
\ Arsh Chauhan
\ 04/19/2016
\ Ex A


\ collatz: Calculates the collatz number fot the 
\         top item in the stack
: collatz ( n -- n )
  dup 0 = if
  0
 else
  dup 2 mod 0 = if
  2 /
 else
  3 * 1 +
  endif
 endif
;

\ collatzSeq: Returns number of times it takes for the 
\ collatz fuction to take n to 1
: collatzSeq ( n --c)
 dup 1 = if 
  drop
  0
 else
  collatz
  dup 1 = if 
  drop
  1
  else  
   recurse
   1 +
   endif
endif
;

\ collcount: Call this from outside 
: collcount ( n -- c)
  ( dup 1 +)
 collatzSeq
;


