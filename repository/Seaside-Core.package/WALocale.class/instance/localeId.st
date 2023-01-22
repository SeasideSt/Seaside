converting
localeId

	^ localeId ifNil: [ 
		  localeId := country ifNil: [ language ] ifNotNil: [ 
			              String streamContents: [ :str | 
				              str
					              nextPutAll: language;
					              nextPut: $-;
					              nextPutAll: country ] ] ]