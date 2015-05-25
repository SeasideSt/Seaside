WABatchedList helps display a collection of items across multiple pages. WABatchedList organizes a collection into pages (or batches) of batchSize items each and renders navigation links for a user to moved between pages. WABatchedList>>batch returns the items to display in the current page or batch. Your code has to display the items.

See WABatchSelection for example of usage.

Instance Variables:
	batchSize	<Integer>	number of items to display on a single page
	currentPage	<Integer>	 index of current page, starts a 1
	items	<SequenceableCollection of Objects>	objects organized into pages for display

