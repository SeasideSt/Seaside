I am the abstract base class for caches that remove entries. Subclasses are intended to use to track sessions.

    Instance Variables
	maximumSize			<Integer>
	maximumRelativeAge		<Integer>
	maximumAbsoluteAge	<Integer>
	overflowAction			<Symbol>
				
maximumSize:
	Number of sessions supported. When this limit is reached the overflow action is run. 0 for no maximum size. Has to be positive.

maximumRelativeAge:
	After so many seconds of inactivity a session is considered expired. 0 for no limit. Has to be positive.

maximumAbsoluteAge:
	After so many seconds after its creation a session is considered expired no matter when it was last accessed. 0 for no limit. Has to be positive.

overflowAction:
	What to do when the maximum number of sessions is reached. Only matters when the maximum size is bigger than 0.
	Possible values:
		#removeRelativeOldest remove the entry that hasn't been accessed for the longest time
		#removeAbsoluteOldest remove the entry that has been created the longest time ago
		#signalError signal WAMaximumNumberOfSessionsExceededError