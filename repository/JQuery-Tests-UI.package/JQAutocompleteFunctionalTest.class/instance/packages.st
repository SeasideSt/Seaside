querying
packages
	^ packages ifNil: [
		packages := (SystemNavigation default allClasses
			select: [ :class | class package packageName beginsWith: 'Seaside' ]
			thenCollect: [ :class | class package ]) asSet asArray sorted: [ :a :b |
				a packageName < b packageName ] ]