WAMiniCalendar renders a monthly calendar. Users can navigate by month, year, or select a year and a month. Users can select a date in the calendar. Set canSelectBlock to control which dates a user can select. Use selectBlock to perform an action when a user selects a date. WAMiniCalendar>>date returns the selected date.

Select "Mini Calendar" tab of the Functional Seaside Test Suite to run an example  (http://127.0.0.1:xxxx/tests/functional/WAMiniCalendarFunctionalTest)

Instance Variables:
	canSelectBlock		<BlockClosure with date argument>	return true if date argument should be rendered with a link, ie user can select that date
	date				<WAValueHolder on a date>	Selected date
	monthIndex			<WAValueHolder on an Integer>	Currently displayed month
	year				<WAValueHolder on an Integer>	Currently displayed year
	selectBlock			<BlockClosure with date argument> called when user selects a date

