*seaside-gemstone-REST-core
argumentNamesOf: aMethod

	^(aMethod argsAndTemps copyFrom: 1 to: aMethod numArgs) collect: [:each | each asString ]