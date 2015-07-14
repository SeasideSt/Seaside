private
performSafely: aBlock
  "catch errors, halts and breakpoints ... service vm is non-interactive ... 
	 record the error (in transaction) and let the process servicing this task terminate ... 
	 it's up to someone else to clean up:)"

  aBlock
    on: Error , Halt , Breakpoint
    do: [ :ex | 
      GRPlatform current
        doTransaction: [ 
          exception := ex.
          DebuggerLogEntry createContinuationLabeled: 'SVCE continuation'.
          (ObjectLogEntry
            error: 'Background task exception: ''' , ex description , ''''
            object: aBlock) addToLog ].
      ^ nil ]