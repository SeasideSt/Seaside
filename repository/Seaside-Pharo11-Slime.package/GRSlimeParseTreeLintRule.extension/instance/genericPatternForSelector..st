*Seaside-Pharo11-Slime
genericPatternForSelector: aSymbol

	^ String streamContents: [ :stream |
		aSymbol keywords keysAndValuesDo: [ :index :value |
			stream space; nextPutAll: value.
			aSymbol last = $:
				ifTrue: [ stream space; nextPutAll: '`@object'; print: index ] ] ]