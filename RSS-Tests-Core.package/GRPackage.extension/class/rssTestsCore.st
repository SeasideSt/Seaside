*rss-tests-core
rssTestsCore
	^ self new
		name: 'RSS-Tests-Core';
		description: 'Unit tests for the "RSS-Core" package.';
		addDependency: 'RSS-Core';
		addDependency: 'Seaside-Tests-Core';
		url: #seasideUrl;
		yourself