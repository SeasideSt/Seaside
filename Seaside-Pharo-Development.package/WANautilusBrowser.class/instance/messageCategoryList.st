accessing
messageCategoryList
	| all categories unclassified |
	all := #'-- all --'. "AllProtocol defaultName is fucked in Pharo 2.0"
	self selectedClass isNil
		ifTrue: [ ^ Array with: all ].
	categories := self selectedClass organization categories.
	categories first = all ifFalse: [ "all is only in 3.0+"
		categories := (Array with: all), categories ].
	unclassified := (Smalltalk at: #Protocol) defaultName. "#unclassified only in 3.0+"
	^ (categories includes: unclassified)
		ifTrue: [
			"'-- all --', 'as yet unclassified', rest sorted alphabetically"
			(Array
				with: categories first
				with: unclassified),
			(categories allButFirst copyWithout: unclassified) sorted ]
		ifFalse: [
			"'-- all --', rest sorted alphabetically"
			(Array with: categories first),
			categories allButFirst sorted ]