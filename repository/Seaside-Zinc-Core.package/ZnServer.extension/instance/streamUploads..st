*Seaside-Zinc-Core
streamUploads: aBoolean

	^ [ self optionAt: #streamUploads put: aBoolean ] 
			ensure: [ self delegate adaptor configureServerForBinaryReading ]