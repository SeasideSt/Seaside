accessing-scripts
lighter
	^ JSStream on: 'updateLightbox();Event.observe(window,"resize",function(){updateLightbox();});'