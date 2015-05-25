actions
raiseHalt
	| context |
	self halt.
	"You should be able to step over the following line and have the current request context
	successfully stored in the variable.
	You should also (ideally anyway, it works on Squeak) be able to Inspect the value of
	'self requestContext' in the Debugger and get a result.
	Finally, you should be able to restart this method in the Debugger and do the above
	again successfully."
	context := self requestContext.
	self inform: 'To be displayed' onAnswer: [ ]