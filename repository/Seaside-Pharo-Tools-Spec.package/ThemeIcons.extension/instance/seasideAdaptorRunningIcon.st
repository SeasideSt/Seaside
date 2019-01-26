*seaside-pharo-tools-spec
seasideAdaptorRunningIcon 
	^ icons
			at: #'seasideAdaptorRunningIcon'
			ifAbsentPut:[ Form fromBinaryStream: (GRPlatform current base64Decode: self seasideAdaptorRunningIconContents) asByteArray readStream ]