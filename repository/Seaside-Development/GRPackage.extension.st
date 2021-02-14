Extension { #name : #GRPackage }

{ #category : #'*seaside-development' }
GRPackage class >> seasideDevelopment [
	^ self new
		name: 'Seaside-Development';
		description: 'Web-based development tools and debugging support.';
		addDependency: 'Seaside-Tools-Web';
		addDependency: 'Seaside-Flow'; "For WAWalkbackErrorHandler"
		url: #seasideUrl;
		yourself
]
