instance creation
fromMimeType: aMimeType
	^ aMimeType main = '*'
		ifTrue: [
			aMimeType sub = '*'
				ifTrue: [ WAWildcardMimeTypeMatch new ]
				ifFalse: [ WASubMimeTypeMatch
					sub: aMimeType sub ] ]
		ifFalse: [
			aMimeType sub = '*'
				ifTrue: [ WAMainMimeTypeMatch
					main: aMimeType main ]
				ifFalse: [ WAFullMimeTypeMatch
					main: aMimeType main
					sub: aMimeType sub ] ]