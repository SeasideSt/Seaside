Extension { #name : #GRPackage }

{ #category : #'*seaside-tools-core' }
GRPackage class >> seasideToolsCore [
	^ self new
		name: 'Seaside-Tools-Core';
		description: 'Administrative tools, useful to have for production and development environments.';
		addDependency: 'Seaside-Core';
		addDependency: 'Seaside-Component'; "only for deprecated class-side method extension"
		addDependency: 'Seaside-RenderLoop'; "for class references in WAAdmin"
		addDependency: 'Seaside-Session'; "for class reference in WAAdmin"
		url: #seasideUrl;
		yourself
]
