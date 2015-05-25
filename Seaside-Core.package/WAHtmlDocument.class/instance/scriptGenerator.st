accessing
scriptGenerator
	^ scriptGenerator ifNil: [ scriptGenerator := WADefaultScriptGenerator new ]