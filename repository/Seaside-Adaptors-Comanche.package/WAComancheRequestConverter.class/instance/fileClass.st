private
fileClass
	^ streamUploads
		ifTrue: [ WATemporaryFile ]
		ifFalse: [ WAFile ]