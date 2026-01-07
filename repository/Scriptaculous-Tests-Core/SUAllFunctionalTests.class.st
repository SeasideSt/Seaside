Class {
	#name : 'SUAllFunctionalTests',
	#superclass : 'SUAllTests',
	#category : 'Scriptaculous-Tests-Core-Functional',
	#package : 'Scriptaculous-Tests-Core',
	#tag : 'Functional'
}

{ #category : 'testing' }
SUAllFunctionalTests class >> canBeRoot [
	^ true
]

{ #category : 'accessing' }
SUAllFunctionalTests class >> description [
	^ 'Scriptaculous Functional Test Suite'
]

{ #category : 'initialization' }
SUAllFunctionalTests class >> initialize [
	(WAAdmin register: self asApplicationAt: 'javascript/scriptaculous')
		preferenceAt: #scriptGeneratorClass put: PTScriptGenerator;
		addLibrary: PTDevelopmentLibrary;
		addLibrary: SUDevelopmentLibrary;
		addLibrary: SUAllTestLibrary
]
