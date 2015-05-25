initialization
initialize
	super initialize.
	windows := OrderedCollection 
					with: ((SUWindow on: [ :w | SUCounterTest on: 10 ]) id: 'window_1'; zIndex: 1000; title: 'Window 1'; yourself)
					with: ((SUWindow on: [ :w | SUFormTest new ]) id: 'window_2';
								zIndex: 1001;
								origin: (300@100);
								extent: 500@240;
								title: 'Window 2';
								yourself)
					with: ((SUWindow on: [ :w | SUTooltipTest new ]) id: 'window_3';
								updateBlock: [ :w :model | model textWithKey: (w tooltipKey) ];
								zIndex: 1003;
								extent: 150@45;
								title: 'Tooltip';
								closeButtonEnabled: false;
								minimizeButtonEnabled: false;
								yourself).
	windows add: ((SUWindow on: [ :w | SUDialogTest new
											answer: [ :script | 
												script alert: 'Window will be closed'. 
												script add: (JSStream on: '$("overlay").hide()').
												w closeOn: script ];
											yourself ]) 
										id: 'dialog_window';
										closeButtonEnabled: false;
										minimizeButtonEnabled: false;
										zIndex: 9999;
										title: 'Window 4'; yourself)
