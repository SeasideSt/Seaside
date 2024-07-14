private
createTotalsPresenter

	^ (WAPluggablePresenter new block: [ :html | 
		html heading
			level: 1;
			with: (counters inject: 0 into:[ :total :c | c counter + total ]) ]) addDecoration: (WATurboFrame newWithId: 'id-total'); yourself