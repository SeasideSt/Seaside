*seaside-pharo40-continuation
serialiseOn: aStream
	aStream nextPut: self.
	1 to: self class instSize do: [ :index |
		aStream nextPut: (self instVarAt: index) ].
	1 to: self localSize do: [ :index |
		aStream nextPut: (self localAt: index) ].