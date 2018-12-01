Extension { #name : #GRPackage }

{ #category : #'*seaside-environment' }
GRPackage classSide >> seasideEnvironment [
	^ self new
		name: 'Seaside-Environment';
		description: 'The standard Seaside distribution environment. This package can depend on all other code packages as needed.';
		addDependency: 'Seaside-Tools-Core';
		addDependency: 'Seaside-Core';
		addDependency: 'Seaside-Component';
		addDependency: 'Seaside-RenderLoop';
		addDependency: 'Seaside-Session';
		addDependency: 'Seaside-Canvas';
		addDependency: 'Seaside-Widgets'; "Users expect #inform:, etc. to be available"
		url: #seasideUrl;
		yourself
]
