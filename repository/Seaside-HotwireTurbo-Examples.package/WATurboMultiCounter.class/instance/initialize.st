initialization
initialize

	super initialize.
	counters := (1 to: 5) collect: [ :each | 
		WATurboCounter new addDecoration: WATurboFrame new; yourself ].
	totals := self createTotalsPresenter