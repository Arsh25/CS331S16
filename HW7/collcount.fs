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


: collcount ( n -- c)
  ( dup 1 +)
 collatzSeq
;


