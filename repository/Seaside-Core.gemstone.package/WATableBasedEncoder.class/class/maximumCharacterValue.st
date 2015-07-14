private
maximumCharacterValue
	"find the maximum value of a character that we can instantiate, for Squeak 3.7 this is 255"
	^ [ Character codePoint: 16rFFFF.
		16rFFFF ]
			on: Error
			do: [ :error  | 16rFF ]