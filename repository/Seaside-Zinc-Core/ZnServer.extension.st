Extension { #name : 'ZnServer' }

{ #category : '*Seaside-Zinc-Core' }
ZnServer >> streamUploads [
	^ self
		optionAt: #streamUploads
		ifAbsent: [ false ] 
]

{ #category : '*Seaside-Zinc-Core' }
ZnServer >> streamUploads: aBoolean [

	| result |
	result := self optionAt: #streamUploads put: aBoolean.
	self delegate adaptor configureServerForBinaryReading.
	^ result
]
