Extension { #name : 'GRPharoPlatform' }

{ #category : '*Seaside-Gettext-Examples' }
GRPharoPlatform >> seasideFilesDirectory [
	| icebergRepo fileTreeRepository |
	icebergRepo := IceRepository registry detect:[ :repo | repo name = 'Seaside' ] ifNone: [ nil ].
	icebergRepo ifNotNil:[ ^ icebergRepo location pathString ].
	fileTreeRepository := MCRepositoryGroup default repositories
		detect: [ :c | 'filetree:*/Seaside/*' match: c description ] 
		ifNone: [ nil ].
	^ fileTreeRepository 
		ifNil:[ Error signal: 'Could not find Seaside git repository to retrieve gettext sample files' ]
		ifNotNil: [ fileTreeRepository directory parent fullName ]
]
