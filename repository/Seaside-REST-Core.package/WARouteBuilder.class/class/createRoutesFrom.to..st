public
createRoutesFrom: aClass to: aSuperClass
	| current seen routes |
	current := aClass.
	seen := IdentitySet new.
	routes := OrderedCollection new.
	[ current notNil ] whileTrue: [ 
		current selectorsAndMethodsDo: [ :selector :method |
			(seen includes: selector) ifFalse: [
				| pragmas |
				pragmas := method pragmas
					select: [ :pragma | configuration includes: (GRPlatform current selectorOfPragma: pragma) ].
				pragmas isEmpty ifFalse: [
					routes add: (pragmas
						inject: (self on: method)
						into: [ :builder :pragma | builder perform: (GRPlatform current selectorOfPragma: pragma) withArguments: pragma arguments ])
							create ].
				seen add: selector ] ].
		current = aSuperClass
			ifTrue: [ ^ routes ].
		current := current superclass ].
	^ routes