private
convertCrLfToCrIn: aString
	^ aString
		copyReplaceAll: (String with: Character cr with: Character lf)
		with: (String with: Character cr)