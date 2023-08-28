as yet unclassified
report

	| objects |
	
	objects := (objectsRead groupBy:[:e | e class ] having:[:e | true ]) associations sorted:[:a :b | a value size >  b value size ].
	^ String streamContents:[:str |
		objects do:[:assoc |
			str 
				nextPutAll: assoc key name;
				nextPutAll: '->';
				nextPutAll: assoc value size asString;
				cr ] ]