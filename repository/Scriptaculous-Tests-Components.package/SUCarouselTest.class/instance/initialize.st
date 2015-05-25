initialization
initialize
	super initialize.
	carousel := SUNavigationCarousel new.
	1 to: 10 do: [ :index |
		carousel
			add: (SUCounterTest on: index)
			label: 'Counter ', index greaseString ]


	