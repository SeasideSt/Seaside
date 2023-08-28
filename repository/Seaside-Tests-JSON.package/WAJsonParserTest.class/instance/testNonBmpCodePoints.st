tests-literals
testNonBmpCodePoints
	| parsed |
	self supportsEmoji ifFalse: [
		^ self ].
	
	"dutch flag as two surrogate pairs"
	parsed := self parse: '"\uD83C\uDDF3\uD83C\uDDF1"'.

	self assert: parsed size equals: 2.
	self assert: parsed first codePoint equals: 16r1F1F3. "Regional Indicator Symbol Letter N"
	self assert: parsed second codePoint equals: 16r1F1F1 "Regional Indicator Symbol Letter L"