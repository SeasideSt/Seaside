private
tempNamesAndValuesIn: aContext do: aTwoArgumentBlock
	((SystemVersion current asString includesSubstring: 'Pharo')
		and: [ SystemVersion current major >= 8 ])
	ifTrue: [ ^ self tempNamesAndValuesInPharo8Plus: aContext do: aTwoArgumentBlock ].
	
	((SystemVersion current asString includesSubstring: 'Squeak')
		and: [ SystemVersion current majorVersionNumber >= 5 ])
	ifTrue: [ ^ self tempNamedAndValuesInSqueak: aContext do: aTwoArgumentBlock ]