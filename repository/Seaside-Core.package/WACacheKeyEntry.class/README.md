I am an entry in the table of WAHashCache.

Besides keys and values I keep track of linked list entries so they can be removed without scanning the list.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	byAccessListEntry:		<WACacheListEntry>
	byCreationListEntry:		<WACacheListEntry>
	key:		<Object>
	keyHash:		<Integer>
	next:		<WACacheKeyEntry>
	value:		<Object>
