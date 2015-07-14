accessing
scriptGeneratorClass
	^ scriptGeneratorClass ifNil: [ scriptGeneratorClass := WADefaultScriptGenerator  ]