visiting
visitPresenter: aPresenter
	super visitPresenter: aPresenter.
	aPresenter childrenDo: [ :each | self visit: each ]