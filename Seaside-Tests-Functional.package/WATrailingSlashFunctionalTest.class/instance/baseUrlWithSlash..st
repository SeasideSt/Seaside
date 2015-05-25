private
baseUrlWithSlash: aBoolean 
	^ self application url
		addToPath: self class name greaseString;
		addField: 'slash'
			value: aBoolean greaseString;
		slash: aBoolean;
		yourself