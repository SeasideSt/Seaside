Class {
	#name : 'WAAllHotwiredFunctionalTests',
	#superclass : 'WAAllFunctionalTests',
	#category : 'Seaside-Tests-HotwireTurbo',
	#package : 'Seaside-Tests-HotwireTurbo'
}

{ #category : 'testing' }
WAAllHotwiredFunctionalTests class >> canBeRoot [
	^ true
]

{ #category : 'testing' }
WAAllHotwiredFunctionalTests class >> description [
	^ 'Seaside Functional Test Suite for Hotwired'
]

{ #category : 'class initialization' }
WAAllHotwiredFunctionalTests class >> initialize [
	(WAAdmin register: self asApplicationAt: 'tests/functional-hotwired')
		sessionClass: WAExpirySession;
		preferenceAt: #actionPhaseContinuationClass put: WATurboCallbackProcessingActionContinuation
]

{ #category : 'initialization' }
WAAllHotwiredFunctionalTests >> initializeTests [

	classes := WAHotwiredFunctionalTest allSubclasses asSortedCollection: [ :a :b | a name < b name ].
	current := WAValueHolder with: classes first new
]
