Class {
	#name : 'WAHotwiredFunctionalTest',
	#superclass : 'WAComponent',
	#category : 'Seaside-Tests-HotwireTurbo',
	#package : 'Seaside-Tests-HotwireTurbo'
}

{ #category : 'updating' }
WAHotwiredFunctionalTest >> updateRoot: aRoot [

	super updateRoot: aRoot.
	aRoot meta turboPrefetch: 'false'.
	aRoot bodyAttributes at: 'data-turbo-prefetch' put: 'false'.
	aRoot javascript
		type: 'module';
		url: WATurboFileLibrary / #turboes2017esmminJs 
]
