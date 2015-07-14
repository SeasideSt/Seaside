*seaside-tests-gemstone-flow
seasideTestsGemStoneFlow
	^ self new
		name: 'Seaside-Tests-GemStone-Flow';
		description: 'GemStone-specific extensions to Seaside-Tests-Flow';
		addDependency: 'Seaside-Tests-Flow';
		url: #gemstoneUrl;
		yourself