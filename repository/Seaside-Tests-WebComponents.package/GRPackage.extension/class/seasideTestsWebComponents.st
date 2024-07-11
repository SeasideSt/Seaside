*Seaside-Tests-WebComponents
seasideTestsWebComponents
	^ self new
		name: 'Seaside-WebComponents-Examples';
		description: 'Tests for Seaside-WebComponents';
		addDependency: 'Seaside-WebComponents-Core';
		addDependency: 'Seaside-Tests-Core';
		addDependency: 'Seaside-Session';
		addDependency: 'Seaside-Examples';
		url: #seasideUrl;
		yourself