private
sampleData

	sampleData ifNil: [ self initializeSampleData ].
	^ sampleData