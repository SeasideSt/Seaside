private
stopGems: gemServer
  self staticRemoteServer
    ifFalse: [ gemServer stopGems ]