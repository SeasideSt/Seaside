private
restartGems: gemServer
  self staticRemoteServer
    ifTrue: [ 
      System commitTransaction.
      self
        notify:
          'evaluate on server: abort; /home/seaside3/gemServer interactiveStart='
            , self gemServerName ]
    ifFalse: [ 
      gemServer restartGems.
      self
        waitForGemServer: gemServer
        message: 'Gems did not restart ' , self gemServerName ]