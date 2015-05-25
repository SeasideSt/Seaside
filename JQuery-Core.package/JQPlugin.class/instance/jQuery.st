private
jQuery
	^ (JQueryClass context: self renderContext)
		rendererClass: self rendererClass;
		yourself