running
isInTestDebuggingMode

	"Note: Implemented using reflection, since otherwise we'd have to redefine TestCase>>debug and TestCase's instance variables."

	| ctx |
	ctx := (Smalltalk includesKey: #GsContext)
		ifTrue:[ ((Smalltalk at: #GsContext) fromLevel: 1) sender sender ]
		ifFalse: [ thisContext ].
	
	50 timesRepeat: [
		ctx ifNil: [ ^ false ].
		(#(#debug #debug:) includes: ctx method selector) ifTrue: [ ^ true ].
		ctx := ctx sender.
	].
	^ false