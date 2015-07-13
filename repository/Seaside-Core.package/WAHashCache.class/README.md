WAHashCacheNG is a hash table based implementation of WACacheNG.

The characteristics of WAHashCacheNG are:
- supports both absolute and relative timeouts at the same time https://www.owasp.org/index.php/Session_Management_Cheat_Sheet#Automatic_Session_Expiration
- supports a maximum size with definable overflow action (expire oldest, expire least recently used, signal exception)
- access by key is fast (O(1) average case O(n) worst case)
- access by value is fast (O(1) average case O(n) worst case)
- reaping expired sessions is proportional (O(n)) to the number of expired session and independent of the total number of sessions (O(1))
- creating a new session independent of the total number of sessions
- does not guard against hash collision attacks, you should not use user generated keys

Instance Variables:
	keyTable 				<Array>
	valueTable				<Array>
	size					<Integer>
	maximumSize			<Integer>
	maximumRelativeAge	<Integer>
	maximumAbsoluteAge	<Integer>
	overflowAction			<Symbol>
	byAccessStart			<WACacheListEntryNG>
	byAccessEnd			<WACacheListEntryNG>
	byCreationStart		<WACacheListEntryNG>
	byCreationEnd			<WACacheListEntryNG>