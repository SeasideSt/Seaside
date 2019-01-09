service instance-server
basicServerOn: port
  "forked by caller"

  | count |
  count := 0.
  [ true ]
    whileTrue: [ 
      self
        gemServer: [ 
          "run maintenance tasks"
          self taskClass performTasks: count ].
      (Delay forMilliseconds: self delayTimeMs) wait.	"Sleep for a minute"
      count := count + 1 ]