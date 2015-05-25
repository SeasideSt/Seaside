private
privatePathParameterMapAt: anIndex ifPresentDo: aOneArgumentBloack ifAbsent: aZeroArgumentBlock
	| parameters |
	pathParameters isNil ifTrue: [
		^ aZeroArgumentBlock value ].
	parameters := pathParameters at: anIndex ifAbsent: [
		^ aZeroArgumentBlock value ].
	parameters isNil ifTrue: [
		^ aZeroArgumentBlock value ].
	^ aOneArgumentBloack value: parameters