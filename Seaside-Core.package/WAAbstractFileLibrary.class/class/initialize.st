class initialization
initialize
	MimeTypes := Dictionary new.
	1 to: self defaultMimeTypes size by: 2 do: [ :index |
		MimeTypes
			at: (self defaultMimeTypes at: index)
			put: (self defaultMimeTypes at: index + 1) ]