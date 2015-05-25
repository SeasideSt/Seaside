WATimeSelector displays dropdown menus (html select) allowing a user to delect a time within a range. "startHour" and "endHour" define the range of selectable times. Time is displayed in 24 hour format. WATimeSelector>>time returns time user selected as a Time object.

See WADateSelectorFunctionalTest for sample of usage.
Select "Date Selector" tab of the Functional Seaside Test Suite to run an example  (http://127.0.0.1:xxxx/seaside/tests/alltests)

Instance Variables:
	endHour	<Integer 0-23>	end of time interval for selectable times
	hour	<Integer 0-23>	selected hour
	minute	<Integer 0-59>	selected minute
	second	<Integer 0-59>	selected second
	startHour	<Integer 0-23>	start of time interval for selectable times
