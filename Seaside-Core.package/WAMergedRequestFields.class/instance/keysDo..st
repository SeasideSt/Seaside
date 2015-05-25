enumerating
keysDo: aBlock
	delegates do: [ :each | each keysDo: aBlock ]