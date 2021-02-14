Extension { #name : #WAAdmin }

{ #category : #'*seaside-development' }
WAAdmin class >> developmentToolsEnabled [
	^ self applicationDefaults parents includes: WADevelopmentConfiguration instance
]

{ #category : #'*seaside-development' }
WAAdmin class >> disableDevelopmentTools [
	self applicationDefaults removeParent: WADevelopmentConfiguration instance.
	self clearConfigurationCaches
]

{ #category : #'*seaside-development' }
WAAdmin class >> enableDevelopmentTools [
	self applicationDefaults addParent: WADevelopmentConfiguration instance.
	self clearConfigurationCaches
]
