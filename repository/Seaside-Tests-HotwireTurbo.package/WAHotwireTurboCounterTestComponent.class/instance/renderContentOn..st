rendering
renderContentOn: html

	html heading
		level: 1;
		with: counter.
	html anchor
		callback: [ self turboShow: (WAHotwireTurboEditableCounterTestComponent newWith: counter) onAnswer: [ :value | counter := value ] ];
		with: 'Edit'