Class {
	#name : #WAGetTextConfiguration,
	#superclass : #WASystemConfiguration,
	#category : 'Seaside-Gettext-Core'
}

{ #category : #description }
WAGetTextConfiguration >> describeOn: config [
	(config string: #gettextDomain)
		label: 'Gettext Domain';
		comment: 'The name of the domain where all lozalized strings should come from.'
]
