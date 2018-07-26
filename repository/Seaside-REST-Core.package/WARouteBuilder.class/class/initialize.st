initialization
initialize
	configuration := IdentitySet new.
	(Pragma allNamed: #configuration in: self)
		do: [ :pragma | configuration add: pragma method selector ]