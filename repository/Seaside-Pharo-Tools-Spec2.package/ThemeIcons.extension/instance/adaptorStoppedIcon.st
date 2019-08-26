*Seaside-Pharo-Tools-Spec2
adaptorStoppedIcon
	^ icons
		at: #adaptorStoppedIcon
		ifAbsentPut: [ Form fromBinaryStream: (GRPlatform current base64Decode: self adaptorStoppedIconContents) asByteArray readStream ]