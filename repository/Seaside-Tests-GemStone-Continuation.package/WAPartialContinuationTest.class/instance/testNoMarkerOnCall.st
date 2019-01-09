testing
testNoMarkerOnCall
	| captured seen |
	captured := false.
	seen := false.
	self	should: [ self callcc: [ :cc | captured := true ]. seen := true ]
		raise: Error.
		
	self deny: captured.
	self deny: seen.