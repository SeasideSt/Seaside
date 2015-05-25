actions
open: aComponent onAnswer: aBlock
	"Replace the current page with aComponent."

	self session presenter
		show: (aComponent
			addDecoration: (WAWindowDecoration new
				cssClass: self cssClass;
				title: self title;
				yourself);
			yourself)
		onAnswer: aBlock