service instance-server
startBasicServerOn: port
  "start instance of seaside adaptor. expected to return."

  | adaptor znServer |
  GRPlatform current seasideLogServerStart: self class name port: port.
  adaptor := self serverClass port: port.
  self serverInstance: adaptor.
  adaptor server
    debugMode: self debugMode;
    log: self log;
    yourself.
  adaptor gemServerStart