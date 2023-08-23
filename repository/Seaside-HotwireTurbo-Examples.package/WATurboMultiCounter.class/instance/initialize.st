initialization
initialize

	super initialize.
	counters := (1 to: 5) collect: [ :each | WATurboCounter new addDecoration: WATurboFrame new; yourself ].
	totals := (WAPluggablePresenter new block: [ :html | 
		html heading
			level: 1;
			with: (counters inject: 0 into:[ :total :c | c counter + total ]) ]) addDecoration: (WATurboFrame newWithId: 'id-total'); yourself