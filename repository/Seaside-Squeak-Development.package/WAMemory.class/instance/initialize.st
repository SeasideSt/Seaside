initialization
initialize
	super initialize.
	instances := IdentityDictionary new.
	formatter := GRPrinter binaryFileSize.
	self session 
		traverseWithMemory: self
		seen: (IdentitySet with: self with: self session with: self application).
	table := self buildTable