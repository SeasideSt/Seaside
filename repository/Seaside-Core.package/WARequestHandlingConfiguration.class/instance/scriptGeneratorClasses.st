private
scriptGeneratorClasses
	^ WAScriptGenerator allSubclasses asSortedCollection: [ :a :b | a name <= b name ]