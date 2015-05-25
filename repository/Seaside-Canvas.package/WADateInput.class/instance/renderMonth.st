private-rendering
renderMonth
	| brush |
	brush := canvas select
		id: self id;
		list: (1 to: 12);
		selected: month;
		yourself.
	self addMonthCallbackToBrush: brush.
	brush labels: [ :ea | Date nameOfMonth: ea ]