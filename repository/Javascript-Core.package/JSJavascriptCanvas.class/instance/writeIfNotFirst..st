private
writeIfNotFirst: aString
	first ifFalse: [
		self document nextPutAll: aString ]