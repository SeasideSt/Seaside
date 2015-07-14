accessing
staticRemoteServer
  StaticRemoteServer ifNil: [ StaticRemoteServer := false ].
  ^ StaticRemoteServer