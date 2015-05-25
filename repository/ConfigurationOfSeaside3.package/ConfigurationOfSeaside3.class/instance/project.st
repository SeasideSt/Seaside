accessing
project

	^ project ifNil: [ | projectAttributes |
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		project := (Smalltalk at: #MetacelloMCProject) new.
		projectAttributes := #().
		projectAttributes := projectAttributes, ((Smalltalk at: #OBNode ifAbsent: []) == nil
			ifTrue: [ #( #'OBNotPresent' ) ]
			ifFalse: [ #( #'OBPresent' ) ]).
		projectAttributes := projectAttributes, ((Smalltalk at: #ParseTreeEnvironment ifAbsent: []) == nil
			ifTrue: [ #( #'RBNotPresent' ) ]
			ifFalse: [ #( #'RBPresent' ) ]).
		project projectAttributes:  projectAttributes.
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear ]