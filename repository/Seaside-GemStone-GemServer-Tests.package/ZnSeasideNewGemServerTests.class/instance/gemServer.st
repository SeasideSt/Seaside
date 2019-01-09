accessing
gemServer
  "ZnSeasideNewGemServerTests staticRemoteServer: true.
   ZnSeasideNewGemServerTests interactiveRemoteServer: true.

   ZnSeasideNewGemServerTests staticRemoteServer: false.
   ZnSeasideNewGemServerTests interactiveRemoteServer: false."

  "mount @/sys/stone/dirs/Seaside3/tode /home seaside3"

  "abort; /home/seaside3/gemServer --interactiveStart=ZnSeasideServer"

  "limit autoCommit false; eval `System transactionMode: #manualBegin` /home/seaside3/gemServer --interactiveStart=ZnSeasideServer"

  | gemServer |
  gemServer := ZnSeasideNewGemServer register: self gemServerName.
  self interactiveRemoteServer
    ifTrue: [ gemServer interactiveMode: true ].
  ^ gemServer