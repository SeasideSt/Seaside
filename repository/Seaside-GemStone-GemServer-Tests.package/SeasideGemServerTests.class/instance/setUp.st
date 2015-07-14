running
setUp
  super setUp.
  registry := GemServerRegistry singleton.
  GemServerRegistry _singleton: nil