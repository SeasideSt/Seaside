public
startSessionWithRoot: aComponent
	| context |
	context := self requestContext.
	context rootComponent: aComponent.
	self next handleFiltered: context