accessing
removeServer: aName
|server|
server :=self serverNamed:aName.
server ==nil ifFalse:[	servers remove: server]