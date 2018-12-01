Extension { #name : #GRPackage }

{ #category : #'*seaside-component' }
GRPackage classSide >> seasideComponent [
	^ self new
		name: 'Seaside-Component';
		description: 'Stateful, reusable components to encapsulate a small part of a page.';
		addDependency: 'Seaside-Core';
		url: #seasideUrl;
		yourself
]
