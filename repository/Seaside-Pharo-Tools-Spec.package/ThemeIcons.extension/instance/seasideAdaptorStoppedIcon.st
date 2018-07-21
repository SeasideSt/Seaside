*seaside-pharo-tools-spec
seasideAdaptorStoppedIcon 
	^ icons
			at: #'seasideAdaptorStoppedIcon'
			ifAbsentPut: [ Form fromBinaryStream: (self seasideAdaptorStoppedIconContents base64Decoded readStream) ]