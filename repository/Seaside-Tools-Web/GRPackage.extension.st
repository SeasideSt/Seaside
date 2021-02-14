Extension { #name : #GRPackage }

{ #category : #'*seaside-tools-web' }
GRPackage class >> seasideToolsWeb [
	^ self new
		name: 'Seaside-Tools-Web';
		description: 'Web-based tools for administering Seaside.';
		addDependency: 'Seaside-Tools-Core';
		addDependency: 'Seaside-RenderLoop';
		addDependency: 'Seaside-Widgets';
		url: #seasideUrl;
		yourself
]
