*seaside-pharo-tools-spec
seasideAdaptorRunningIcon 
	^ icons
			at: #'seasideAdaptorRunningIcon'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self seasideAdaptorRunningIconContents readStream) ].