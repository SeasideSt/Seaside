private
lastUpperCaseIndexIn: aString
	^ aString findLast: [ :each | each isUppercase ]