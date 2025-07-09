*seaside-squeak-rest-core
argumentNamesOf: aCompiledMethod
	^ aCompiledMethod methodNode arguments collect: [ :each | each key ]