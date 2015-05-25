tests
testNonLatinWindowsPath
	| koreanName |
	"If the following assertion fails, your Smalltalk dialect most probably does not support non-latin characters. This is true for Squeak 3.7. If your Smalltalk dialect does support non-latin characters adjust the test."
	self shouldnt:  [
		koreanName := (String
			with: (Character codePoint: 50976)
			with: (Character codePoint: 47532)
			with: (Character codePoint: 47484)), '.txt' ]
		raise: Error.

	file fileName: koreanName.
	self assert: file fileName = koreanName.
	file fileName: 'C:\important\', koreanName.
	self assert: file fileName = koreanName