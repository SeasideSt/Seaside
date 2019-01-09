parsing
parsePathParameters: aString at: anIndex from: start to: end
	| parameterStart |
	parameterStart := start.
	[ parameterStart > 0 and: [ parameterStart < end ] ] whileTrue: [
		| nameEnd parameterEnd |
		nameEnd := aString indexOf: $= startingAt: parameterStart.
		parameterEnd := aString indexOf: $; startingAt: parameterStart.
		parameterEnd := parameterEnd > 0
			ifTrue: [ parameterEnd min: end ]
			ifFalse: [ end ].
		(nameEnd > 0 and: [ nameEnd < end ])
			ifTrue: [
				| parameterName valueStart |
				parameterName := self class decodePercent: aString from: parameterStart to: nameEnd.
				valueStart := nameEnd + 1.
				[ valueStart > 0 and: [ valueStart < parameterEnd ] ] whileTrue: [
					| valueEnd |
					valueEnd := aString indexOf: $, startingAt: valueStart + 1.
					valueEnd := valueEnd > 0
						ifTrue: [ valueEnd min: parameterEnd ]
						ifFalse: [ parameterEnd ].
					self
						addPathParameterAt: anIndex 
						key: parameterName
						value: (self class decodePercent: aString from: valueStart to: valueEnd).
					valueStart := valueEnd + 1 ] ]
			ifFalse: [
				self addPathParameterAt: anIndex key: (self class decodePercent: aString from: parameterStart to: parameterEnd) ].
		parameterStart := parameterEnd + 1 ]