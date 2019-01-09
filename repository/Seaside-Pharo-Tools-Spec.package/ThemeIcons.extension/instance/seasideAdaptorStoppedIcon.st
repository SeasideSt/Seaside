*seaside-pharo-tools-spec
seasideAdaptorStoppedIcon 
	^ icons
			at: #'seasideAdaptorStoppedIcon'
			ifAbsentPut:[ Form fromBinaryStream: (GRPlatform current base64Decode: self seasideAdaptorStoppedIconContents) asByteArray readStream ]