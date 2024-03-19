*Seaside-Zinc-Core
streamUploads: aBoolean

	| result |
	result := self optionAt: #streamUploads put: aBoolean.
	self delegate adaptor configureServerForBinaryReading.
	^ result