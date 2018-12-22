tests
testIncludesUnsafeXmlCharacter
	| encoder |
	encoder := WAPharoXmlEncoder on: (WriteStream on: String new).
	'"<&' do: [ :each |
		self assert: (encoder includesUnsafeCharacter: (String with: each)).
		self assert: (encoder includesUnsafeCharacter: 'a', (String with: each)).
		self assert: (encoder includesUnsafeCharacter: (String with: each), 'a') ].
	
	"just make sure the method doesn't blow up on empty strings"
	encoder includesUnsafeCharacter: ''.