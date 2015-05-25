adding
addField: aKey value: aValue
	"Add the query field aKey with aValue to the receiving url."
	
	aKey isEmpty 
		ifFalse: [ self queryFields at: aKey add: aValue ]