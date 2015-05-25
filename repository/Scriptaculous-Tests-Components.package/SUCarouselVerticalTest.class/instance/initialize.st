initialization
initialize
	super initialize.
	carousel := SUVerticalCarousel new.
	carousel
		elementExtent: (Point x: 370 y: 60);
		numVisible: 3;
		scrollInc: 3;
		navMargin: 14;
		animationSpeed: 0.3.
	1 to: 20 do:  [ :index | 
			carousel add: (SUSmallBoxTest new
				text: 'Test Box: ', index greaseString;
				yourself) ]