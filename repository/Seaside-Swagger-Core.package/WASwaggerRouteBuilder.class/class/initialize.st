initialization
initialize
	configuration := IdentitySet new.
	(Pragma allNamed: #configuration from: self to: WARouteBuilder)
		do: [ :pragma | configuration add: pragma methodSelector ]