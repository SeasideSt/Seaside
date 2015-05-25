running
go
	self call: component1 onAnswer: [ :a1 |
		self call: component2 onAnswer: [ ] ]