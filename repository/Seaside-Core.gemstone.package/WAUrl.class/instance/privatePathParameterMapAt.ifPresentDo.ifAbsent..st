private
privatePathParameterMapAt: anIndex ifPresentDo: aOneArgumentBlock ifAbsent: aZeroArgumentBlock
	| parameters |
	pathParameters isNil ifTrue: [
		^ aZeroArgumentBlock value ].
	parameters := pathParameters at: anIndex ifAbsent: [
		^ aZeroArgumentBlock value ].
	parameters isNil ifTrue: [
		^ aZeroArgumentBlock value ].
	^ aOneArgumentBlock value: parameters