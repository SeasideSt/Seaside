accessing
url
	^ self options at: 'url' ifAbsentPut: [ WAUrl new ]