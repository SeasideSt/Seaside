Extension { #name : #WAAdmin }

{ #category : #'*seaside-development' }
WAAdmin classSide >> developmentToolsEnabled [
	^ self applicationDefaults parents includes: WADevelopmentConfiguration instance
]

{ #category : #'*seaside-development' }
WAAdmin classSide >> disableDevelopmentTools [
	self applicationDefaults removeParent: WADevelopmentConfiguration instance
]

{ #category : #'*seaside-development' }
WAAdmin classSide >> enableDevelopmentTools [
	self applicationDefaults addParent: WADevelopmentConfiguration instance
]
