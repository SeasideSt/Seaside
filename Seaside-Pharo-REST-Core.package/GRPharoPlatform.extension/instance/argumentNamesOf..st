*seaside-pharo-rest-core
argumentNamesOf: aCompiledMethod
	^ aCompiledMethod methodNode arguments collect: [ :each | each key ]