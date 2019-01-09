I am a value in a WABulkReapingCache. It's important that my values are not concurrently updated in order to avoid commit conflicts on GemStone/S.

accessTime:		only set by reaper
creationTime:	immutable, set only once
value:			immutable, set only once
lastCount:		only set by reaper
count:			updated concurrently but this is not an issue since we use a WAReducedConflictCounter

    Instance Variables
	count:			<WAReducedConflictCounter>
	lastCount:		<Integer>
	creationTime:	<Integer>
	accessTime:		<Integer>
	value:			<Object>
