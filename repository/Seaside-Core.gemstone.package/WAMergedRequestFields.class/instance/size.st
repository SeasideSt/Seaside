accessing
size
	^ delegates inject: 0 into: [ :result :each | result + each size ]