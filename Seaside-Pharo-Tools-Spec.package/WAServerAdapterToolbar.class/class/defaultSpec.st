specs
defaultSpec

	<spec>
	^ SpecLayout composed
		newRow: [ :row | 
			row
				add: #(model startButton);
				add: #(model stopButton);
				add: #(model browseButton) ];
		yourself