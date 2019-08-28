class initialization
initialize
	Smalltalk ui icons icons
		at: #adaptorRunningIcon put: (Form fromBinaryStream: (GRPlatform current base64Decode: self adaptorRunningIconContents) asByteArray readStream);
		at: #adaptorStoppedIcon put: (Form fromBinaryStream: (GRPlatform current base64Decode: self adaptorStoppedIconContents) asByteArray readStream)