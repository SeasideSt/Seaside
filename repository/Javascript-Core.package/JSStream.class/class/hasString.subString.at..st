encoding - private
hasString: aString subString: aSubstring at: anIntegerIndex
	"Strings with < a complicated encoding in Javascript"

	(anIntegerIndex + aSubstring size) > (aString size + 1) ifTrue: [
		^ false ].
	1 to: aSubstring size do: [ :index |
		(aString at: anIntegerIndex + index - 1) = (aSubstring at: index)
			ifFalse: [ ^ false ] ].
	^ true