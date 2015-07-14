service instance-server
startBasicServerOn: port
  "start instance of seaside adaptor. expected to return."

  | adaptor |
  GRPlatform current seasideLogServerStart: self class name port: port.
  adaptor := self serverClass port: port.
  self serverInstance: adaptor.
  adaptor gemServerStart