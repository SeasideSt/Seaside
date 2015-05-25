writing-private
writePortsOn: aStream
	ports isEmptyOrNil
		ifTrue: [ ^ self ].
	aStream nextPutAll: '; Port="'.
	self ports do: [ :each | aStream print: each ] separatedBy: [ aStream nextPut: $, ].
	aStream nextPut: $"