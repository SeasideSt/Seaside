private
initializeUrlTable
	table := ByteArray new: 256.
	1 to: 256 do: [ :index |
		('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~' includes: (Character codePoint: index - 1))
			ifTrue: [ table at: index put: 0 ]
			ifFalse: [ table at: index put: 1 ] ]