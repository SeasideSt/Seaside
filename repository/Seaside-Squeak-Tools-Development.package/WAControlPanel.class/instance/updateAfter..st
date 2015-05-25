user interface
updateAfter: aBlock
	" small helper "
	| res |
	res := aBlock value.
	self changed: #adaptorsList.
	self changed: #information.
	^ res