configuration
windowColorSpecification

	| bright pastel |
	bright :=  Color r: 0.212 g: 0.637 b: 1.0.
	pastel := (Color r: 0.189 g: 0.7 b: 1.0) adjustSaturation: -0.5 brightness: 0.
	^ WindowColorSpec
		classSymbol: self name
		wording: self title
		brightColor: bright
		pastelColor: pastel
		helpMessage: 'The Seaside control panel that helps organizing adaptors'