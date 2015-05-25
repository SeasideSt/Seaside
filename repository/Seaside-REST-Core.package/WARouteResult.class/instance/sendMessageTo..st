public
sendMessageTo: anObject
	| arguments |
	arguments := Array new: route argumentCount.
	route mapArgumentsWithElements: elements parameters: parameters into: arguments.
	^ route
		sendSelectorWith: arguments
		to: anObject