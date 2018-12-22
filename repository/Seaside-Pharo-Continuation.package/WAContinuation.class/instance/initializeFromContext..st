private
initializeFromContext: aContext
	| context stream |
	self initialize.
	context := aContext.
	stream := WriteStream on: (Array new: 200).
	[ context notNil ] whileTrue: [
		stream nextPut: context.
		1 to: context class instSize do: [ :index |
			stream nextPut: (context instVarAt: index) ].
		1 to: context size do: [ :index |
			stream nextPut: (context at: index) ].
		context := context sender ].
	values := stream contents