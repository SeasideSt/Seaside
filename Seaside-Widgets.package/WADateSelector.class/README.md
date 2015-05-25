WADateSelector displays dropdown menus (html select) allowing a user to delect a date within a range. "startYear" and "endYear" define the range of selectable dates. Date displayed in month, day, year format. WADateSelector>>date returns date user selected as a Date object.

See WADateSelectorFunctionalTest for sample of usage.
Select "Date Selector" tab of the Functional Seaside Test Suite to run an example  (http://127.0.0.1:xxxx/seaside/tests/alltests)

Instance Variables:
	day	<Integer 1-31> selected day
	endYear	<Integer>	end of range of dates user is allowed to select, not required to use 4 digits
	month	<Integer 1-12>	selected month
	startYear	<Integer>	 start of range of dates user is allowed to select, not required to use 4 digits
	year	<Integer>	selected year

