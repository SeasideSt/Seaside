accessing-headers
removeHeaderAt: aString
	"Removes all occurences of the header value aString."

	^ self headers removeKey: aString