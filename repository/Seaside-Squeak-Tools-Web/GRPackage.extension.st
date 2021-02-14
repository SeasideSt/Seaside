Extension { #name : #GRPackage }

{ #category : #'*Seaside-Squeak-Tools-Web' }
GRPackage class >> seasideSqueakToolsWeb [
	^ self new
		name: 'Seaside-Squeak-Tools-Web';
		description: 'Squeak-specific web-based administration tools for Seaside.';
		addDependency: 'Seaside-Tools-Web';
		addDependency: 'Seaside-Pharo-Core';
		addDependency: 'Seaside-Pharo-Canvas';
		url: #seasideUrl;
		yourself
]
