*seaside-pharo-tools-spec
seasideAdaptorStoppedIcon 
	^ icons
			at: #'seasideAdaptorStoppedIcon'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self seasideAdaptorStoppedIconContents readStream) ].