private
captureFrom: aSourceContext to: aTargetContext
	"Utility method to capture the contexts between aSourceContext and aTargetContext."

	| stream context |
	context := aSourceContext.
	stream := WriteStream on: (Array new: 100).
	[ context isNil or: [ context == aTargetContext ] ] whileFalse: [
		stream nextPut: context.
		1 to: context class instSize do: [ :index |
			stream nextPut: (context instVarAt: index) ].
		1 to: context size do: [ :index |
			stream nextPut: (context at: index) ].
		context := context sender ].
	context isNil
		ifTrue: [ WAMarkerNotFound signal: aTargetContext printString , ' not found while capturing continuation.' ].
	^ stream contents