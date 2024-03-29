Class {
	#name : 'WAGetTextConfiguration',
	#superclass : 'WASystemConfiguration',
	#category : 'Seaside-Gettext-Core',
	#package : 'Seaside-Gettext-Core'
}

{ #category : 'description' }
WAGetTextConfiguration >> describeOn: config [
	(config string: #gettextApplicationName)
		label: 'Gettext Name';
		comment: 'The application name where all lozalized strings should come from.'
]
