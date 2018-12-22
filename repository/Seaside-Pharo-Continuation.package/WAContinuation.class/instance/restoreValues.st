private
restoreValues
	| stream context |
	stream := values readStream.
	[ stream atEnd ] whileFalse: [
		context := stream next.
		1 to: context class instSize do: [ :index |
			context instVarAt: index put: stream next ].
		1 to: context size do: [ :index |
			context at: index put: stream next ] ]