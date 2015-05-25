plugin-halos
haloFor: aPresenter
	^ halos at: aPresenter ifAbsentPut: [ aPresenter haloClass on: aPresenter ]