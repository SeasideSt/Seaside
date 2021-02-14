Extension { #name : #WAAbstractFileLibrary }

{ #category : #'*seaside-tools-web' }
WAAbstractFileLibrary >> configurationComponent [
	^ WAFileLibraryEditor new
		library: self;
		yourself
]
