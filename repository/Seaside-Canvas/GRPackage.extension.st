Extension { #name : #GRPackage }

{ #category : #'*seaside-canvas' }
GRPackage classSide >> seasideCanvas [
	^ self new
		name: 'Seaside-Canvas';
		description: 'The mechanism of choice to generate valid and reusable XHTML markup.';
		addDependency: 'Seaside-Core';
		url: #seasideUrl;
		yourself

]
