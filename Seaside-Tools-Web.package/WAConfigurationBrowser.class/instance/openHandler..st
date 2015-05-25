actions
openHandler: aHandler
	super openHandler: aHandler.
	aHandler isNil ifFalse: [ self configure: aHandler ]