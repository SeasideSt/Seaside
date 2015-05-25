accessing
typesDictionary
	^ Dictionary new
		add: $1 -> 'decimal';
		add: $a -> 'lower-alpha';
		add: $A -> 'upper-alpha';
		add: $i -> 'lower-roman';
		add: $I -> 'upper-roman';
		yourself