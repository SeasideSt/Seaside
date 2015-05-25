private
useCompileUseNewCompiler: aBoolean during: aBlock
	| oldValue |
	self supportsSwitchToNewCompiler
		ifFalse: [ ^ self ].
	oldValue := GRPharoPlatform current useByteArrayLiterals.
	[ (Smalltalk at: #Preferences) setPreference: #compileUseNewCompiler toValue: aBoolean.
	aBlock value ]
		ensure: [
			GRPharoPlatform current useByteArrayLiterals ifTrue: [
				Preferences setPreference: #compileUseNewCompiler toValue: oldValue ] ]