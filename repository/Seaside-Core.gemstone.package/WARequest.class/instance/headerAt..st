accessing
headerAt: aKey
	^ self headerAt: aKey ifAbsent: [ nil ]