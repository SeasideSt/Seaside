Extension { #name : #GRPackage }

{ #category : #'*jquery-json' }
GRPackage classSide >> jQueryJson [
	^ self new
		name: 'JQuery-JSON';
		description: 'JSON convience functionality for the jQuery integration for Seaside.';
		addDependency: 'JQuery-Core';
		addDependency: 'Seaside-JSON-Core';
		url: #seasideUrl;
		yourself
]
