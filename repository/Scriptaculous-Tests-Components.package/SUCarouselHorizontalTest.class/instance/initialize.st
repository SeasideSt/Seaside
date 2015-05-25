initialization
initialize
	super initialize.
	carousel := SUHorizontalCarousel new.
	carousel elementExtent: (Point x: 80 y: 80).
	1 to: 50 do:  [ :index | 
		carousel add: (SUSmallBoxTest new
			text: 'Test Box: ', index greaseString;
			yourself) ]