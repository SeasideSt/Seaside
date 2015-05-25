WAAlphabeticBatchedList organizes a collection of items into pages for display. A page contains all items whose string representation (item displayString) starts with the same character. WAAlphabeticBatchedList only displays the navigation (alphabet with links) for the list. Your code needs to display the current page.

Use WAAlphabeticBatchedList>>items: to set the collections of items.
Use WAAlphabeticBatchedList>>batch to get the items to display on the current page

See WABatchFunctionalTest for example of usage.
Select "Batch" tab of the Functional Seaside Test Suite to run an example  (http://127.0.0.1:xxxx/seaside/tests/alltests)

Instance Variables:
	currentPage	<Character>	the character of the curent page
	items	<(Collection of: (Object ))> collection of the items managed by WAAlphabeticBatchedList. Collection is sorted before items are displayed.
