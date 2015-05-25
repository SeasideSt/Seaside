accessing
response
	^ super response ifNil: [ response := WAComboResponse external: (GRPlatform current writeCharacterStreamOn: (String new: 4096)) ]