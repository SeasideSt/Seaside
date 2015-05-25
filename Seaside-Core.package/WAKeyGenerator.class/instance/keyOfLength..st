public
keyOfLength: anInteger
	"Answer a random key as a string with the length anInteger. This does not use any of the fancy collection methods for speed reasons."

	| key |
	key := String new: anInteger.
	1 to: anInteger do: [ :index | key at: index put: (space at: (generator nextInt: space size)) ].
	^ key