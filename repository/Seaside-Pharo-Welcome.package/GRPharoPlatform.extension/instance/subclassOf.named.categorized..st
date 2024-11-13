*Seaside-Pharo-Welcome
subclassOf: aSuperClass named: aNameSymbol categorized: aCategoryString
	^ (aSuperClass respondsTo: #<<)
		ifTrue: [
			aSuperClass << aNameSymbol
				package: aCategoryString;
				install ]
		ifFalse: [
			super
				subclassOf: aSuperClass 
				named: aNameSymbol
				categorized: aCategoryString ]