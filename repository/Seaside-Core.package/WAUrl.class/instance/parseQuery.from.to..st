parsing
parseQuery: aString from: queryStart to: queryEnd
	| parameterStart |
	parameterStart := queryStart.
	[ parameterStart > 0 and: [ parameterStart < queryEnd ] ] whileTrue: [
		| nameEnd parameterEnd |
		nameEnd := aString indexOf: $= startingAt: parameterStart.
		parameterEnd := aString indexOf: $& startingAt: parameterStart.
		parameterEnd := parameterEnd > 0
			ifTrue: [ parameterEnd min: queryEnd ]
			ifFalse: [ queryEnd ].
		(nameEnd > 0 and: [ nameEnd < queryEnd ])
			ifTrue: [
				self
					addField: (self class decodePercentAndPlus: aString from: parameterStart to: nameEnd)
					value: (self class decodePercentAndPlus: aString from: nameEnd + 1 to: parameterEnd) ]
			ifFalse: [
				self addField: (self class decodePercentAndPlus: aString from: parameterStart to: parameterEnd) ].
		parameterStart := parameterEnd + 1 ]