Extension { #name : #GRPackage }

{ #category : #'*rss-examples' }
GRPackage class >> rssExamples [
	^ self new
		name: 'RSS-Examples';
		description: 'Examples of how to use the "RSS-Core" package.';
		addDependency: 'RSS-Core';
		addDependency: 'Seaside-Tools-Core';
		url: #seasideUrl;
		yourself
]
