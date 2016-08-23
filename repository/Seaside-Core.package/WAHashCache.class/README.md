WAHashCache is a hash table based implementation of WACache.

The characteristics of WAHashCache are:
- supports both absolute and relative timeouts at the same time https://www.owasp.org/index.php/Session_Management_Cheat_Sheet#Automatic_Session_Expiration
- supports a maximum size with definable overflow action (expire oldest, expire least recently used, signal exception)
- access by key is fast (O(1) average case O(n) worst case)
- reaping expired sessions is proportional (O(n)) to the number of expired session and independent of the total number of sessions (O(1))
- creating a new session independent of the total number of sessions
- does not guard against hash collision attacks, you should not use user generated keys

Instance Variables:
	keyTable 				<Array<WACacheKeyEntry>>
	size					<Integer>
	byAccessStart			<WACacheListEntry>
	byAccessEnd			<WACacheListEntry>
	byCreationStart		<WACacheListEntry>
	byCreationEnd			<WACacheListEntry>

keyTable:
	Open hash table of  WACacheKeyEntry

byAccessStart
	Head of the linked list sorted by access time

byAccessEnd	
	Tail of the linked list sorted by access time

byCreationStart
	Head of the linked list sorted by creation time

byCreationEnd
	Tail of the linked list sorted by creation time


The implementation is a combination of:
- an open hash table, used for look ups by key 
- a linked list of cache entries sorted by creation time, used for reaping by absolute age
- a linked list of cache entries sorted by access time, used for reaping by relative age

For every cache entry there is a nofr in the hash table and a node in both of the linked lists. It is possible to navigate from every node for a key to every other node of the same key. This is required for removing and updating entries.