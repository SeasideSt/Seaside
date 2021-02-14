Extension { #name : #GRPackage }

{ #category : #'*jquery-tests-json' }
GRPackage class >> jQueryTestsJson [
	^ self new
		name: 'JQuery-Tests-JSON';
		description: 'Unit tests for the JQuery-Tests-JSON package.';
		addDependency: 'JQuery-JSON';
		addDependency: 'JQuery-Tests-Core';
		url: #seasideUrl;
		yourself
]
