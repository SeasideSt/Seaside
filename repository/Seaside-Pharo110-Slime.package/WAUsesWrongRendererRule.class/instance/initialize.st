initialization
initialize

	super initialize.
	self 
		matchesAny: #(
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