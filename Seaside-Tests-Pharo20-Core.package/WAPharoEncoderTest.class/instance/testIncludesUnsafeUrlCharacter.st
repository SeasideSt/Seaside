tests
testIncludesUnsafeUrlCharacter
	| encoder unsafeCharacters |
	encoder := WAPharoUrlEncoder on: (WriteStream on: String new).
	unsafeCharacters := ((0 to: 127)
		collect: [ :each | Character codePoint: each ])
		reject: [ :each | 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~' includes: each ].
	
	unsafeCharacters do: [ :each |
		self assert: (encoder includesUnsafeCharacter: (String with: each)).
		self assert: (encoder includesUnsafeCharacter: 'a', (String with: each)).
		self assert: (encoder includesUnsafeCharacter: (String with: each), 'a') ].
	
	"make sure the method does not blow up on empty strings"
	encoder includesUnsafeCharacter: ''