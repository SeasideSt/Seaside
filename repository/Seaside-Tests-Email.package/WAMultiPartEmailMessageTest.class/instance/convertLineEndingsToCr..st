private
convertLineEndingsToCr: aString
	"converts a string to only use cr line endings"
	(aString includes: Character lf) ifFalse: [ ^ aString ].	"No Lf's ; nothing to do"
	(aString includes: Character cr) ifFalse: [
		^ aString copyReplaceAll: (String with: Character lf) with: (String with: Character cr) ].  "Only Lf's; change them to Cr's"
	^ (aString copyReplaceAll: (String with: Character cr with: Character lf) with: (String with: Character cr))
		copyReplaceAll: (String with: Character lf) with: (String with: Character cr)