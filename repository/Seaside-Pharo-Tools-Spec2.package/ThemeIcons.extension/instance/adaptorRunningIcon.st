*Seaside-Pharo-Tools-Spec2
adaptorRunningIcon
	^ icons
		at: #adaptorRunningIcon
		ifAbsentPut: [ Form fromBinaryStream: (GRPlatform current base64Decode: self adaptorRunningIconContents) asByteArray readStream ]