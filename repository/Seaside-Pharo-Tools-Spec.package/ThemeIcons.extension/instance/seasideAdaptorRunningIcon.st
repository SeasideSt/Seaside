*seaside-pharo-tools-spec
seasideAdaptorRunningIcon 
	^ icons
			at: #'seasideAdaptorRunningIcon'
			ifAbsentPut:[ Form fromBinaryStream: (self seasideAdaptorRunningIconContents base64Decoded readStream) ]