private
packageNameOf: aPackage
	^ (aPackage respondsTo: #name)
		ifTrue: [ aPackage name ]
		ifFalse: [ aPackage packageName ]