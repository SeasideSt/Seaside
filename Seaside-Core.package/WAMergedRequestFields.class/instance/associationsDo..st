enumerating
associationsDo: aBlock
	delegates do: [ :each | each associationsDo: aBlock ]