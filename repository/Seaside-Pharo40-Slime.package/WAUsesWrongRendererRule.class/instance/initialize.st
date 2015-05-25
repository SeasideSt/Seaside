initialization
initialize
	super initialize.
	self matcher 
		matchesAnyOf: #(
			" JQuery: "
			'``@obj ajax html: [ :`r | | `@temps | `@.statements ]'
			'``@obj load html: [ :`r | | `@temps | `@.statements ]'
			'``@obj ajax script: [ :`r | | `@temps | `@.statements ]'
			'``@obj load script: [ :`r | | `@temps | `@.statements ]'
			'``@obj ajax text: [ :`r | | `@temps | `@.statements ]'
			'``@obj load text: [ :`r | | `@temps | `@.statements ]'
			" Scriptaculous: "
			'``@obj updater callback: [ :`r | | `@temps | `@.statements ]'
			'``@obj evaluator callback: [ :`r | | `@temps | `@.statements ]'
			'``@obj periodical callback: [ :`r | | `@temps | `@.statements ]'
			'``@obj autocompleter callback: [ :`r | | `@temps | `@.statements ]'
			'``@obj inPlaceEditor callback: [ :`r | | `@temps | `@.statements ]'
			'``@obj inPlaceCollectionEditor callback: [ :`r | | `@temps | `@.statements ]' )
		do: [ :node :answer | 
			(answer isNil and: [ node arguments first references: node receiver receiver name ])
				ifTrue: [ node arguments first ]
				ifFalse: [ answer ] ]