*seaside-tests-gemstone-continuation
seasideTestsGemStoneContinuation
	^ self new
		name: 'Seaside-Tests-GemStone-Continuation';
		description: 'Tests of GemStone continuation implementation';
		addDependency: 'Seaside-GemStone-Continuation';
		addDependency: 'Grease-Tests-Core';
		url: #gemstoneUrl;
		yourself