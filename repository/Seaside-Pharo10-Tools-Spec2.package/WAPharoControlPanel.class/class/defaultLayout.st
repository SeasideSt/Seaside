layout
defaultLayout
	^ SpPanedLayout newVertical
		add: #adaptors;
		add:
			(SpBoxLayout newVertical
				add: #actionBar
					expand: false
					fill: false
					padding: 0;
				add: #infos;
				yourself);
		yourself