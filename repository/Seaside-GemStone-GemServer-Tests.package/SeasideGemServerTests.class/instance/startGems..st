private
startGems: gemServer
  self staticRemoteServer
    ifTrue: [ 
      System commitTransaction.
      self
        notify:
          'evaluate on server: abort; /home/seaside3/gemServer interactiveStart='
            , self gemServerName ]
    ifFalse: [ 
      gemServer startGems.
      self
        waitForGemServer: gemServer
        message: 'Gems did not start ' , self gemServerName ]