Class {
	#name : #WAAttributeInheritanceFilter,
	#superclass : #OBFilter,
	#category : 'Seaside-Tools-OmniBrowser'
}

{ #category : #filtering }
WAAttributeInheritanceFilter >> icon: aSymbol forNode: aNode [
	aNode isAttribute
		ifFalse: [ ^ #blank ].
	^ aNode isOverride
		ifTrue: [ 
			aNode isOverridden 
				ifTrue: [ #arrowUpAndDown ] 
				ifFalse: [ #arrowUp ] ]
		ifFalse: [ 
			aNode isOverridden 
				ifTrue: [ #arrowDown ] 
				ifFalse: [ #blank ] ]
]
