*Seaside-Gettext-Examples
seasideFilesDirectory
	| icebergRepo fileTreeRepository |
	icebergRepo := IceRepository  registry detect:[ :repo | repo name = 'Seaside' ] ifNone: [ nil ].
	icebergRepo ifNotNil:[ ^ icebergRepo location pathString ].
	fileTreeRepository := MCRepositoryGroup default repositories
		detect: [ :c | 'filetree:*/Seaside/*' match: c description ] 
		ifNone: [ nil ].
	^ fileTreeRepository 
		ifNil:[ Error raiseSignal: 'Could not find Seaside repository with gettext sample files' ]
		ifNotNil: [ fileTreeRepository description ]