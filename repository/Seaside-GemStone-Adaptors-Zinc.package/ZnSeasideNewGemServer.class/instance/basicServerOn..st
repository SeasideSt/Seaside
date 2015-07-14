service instance-server
basicServerOn: port
  "forked by caller"

  | adaptor znServer |
  adaptor := self serverInstance.
  znServer := adaptor server.
  znServer
    gemServer: self;
    port: port;
    gemServerOptions: self options;
    yourself.
  znServer initializeServerSocket.
  [ 
  [ 
  self
    gemServer: [ 
      znServer serverSocket isValid
        ifTrue: [ znServer serveConnectionsOn: znServer serverSocket ] ]
    beforeUnwind: [ :ex | ex pass ] ]
    repeat ]
    ifCurtailed: [ znServer releaseServerSocket ]