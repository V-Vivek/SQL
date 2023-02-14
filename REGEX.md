## ^	
- caret(^) matches Beginning of string
- e.g. Gives all the names starting with ‘sa’.Example- sam, samarth.  
```SELECT name FROM student_tbl WHERE name REGEXP '^sa';```

## $	
- End of string
- e.g. Gives all the names ending with ‘on’.Example – norton, merton.  
```SELECT name FROM student_tbl WHERE name REGEXP 'on$';```

## ? 
- Matches zero or one occurrence of the preceding character or group. 
### Matching single character
- e.g. The regular expression ```colou?r``` would match "color" or "colour".
### Matching group
- Use parentheses to group the expression and then apply the ?
- e.g. The regular expression ```(http://)?www.example.com``` would match both "http://www.example.com" and "www.example.com"

## []
- Gives all the names containing ‘j’ or ‘z’.Example – Lorentz, Rajs.  
```SELECT name FROM student_tbl WHERE name REGEXP '[jz]' ;```
- Matches any lower case letter between ‘a’ to ‘j’  
```SELECT name FROM student_tbl WHERE name REGEXP '[a-j] ;```

## [^]
- Matches any character not listed between the square brackets
- e.g. Gives all the names not containing ‘j’ or ‘z’. Example – nerton, sewall.  
```SELECT name FROM student_tbl WHERE name REGEXP '[^jz]' ;```

## |
- OR(|) matches any of the patterns p1, p2, or p3 (p1|p2|p3)
- Gives all the names containing ‘be’ or ‘ae’.Example – Abel, Baer.  
```SELECT name FROM student_tbl WHERE name REGEXP 'be|ae' ;```

## .
- Matches any single character except a newline character. 
- e.g. The regular expression would match "bat", "bet", "bit", or "but".  
```SELECT name FROM student_tbl WHERE name REGEXP 'b.t' ;```

## {}
- Used to specify the exact number of times a character or group should be repeated.
- e.g. The regular expression ```a{3}``` would match "aaa", but not "aa" or "aaaa". 
- The regular expression ```a{3,}``` would match "aaa", "aaaa", "aaaaa", and so on. 
- The regular expression ```a{3,5}``` would match "aaa", "aaaa", or "aaaaa", but not "aa" or "aaaaaaaa".

