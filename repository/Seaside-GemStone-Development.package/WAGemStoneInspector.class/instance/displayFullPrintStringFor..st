actions
displayFullPrintStringFor: anObject

	self call: (WAStringInspector new
		string: anObject printString;
		yourself)