running
tearDown
  super tearDown.
  GemServerRegistry _singleton: registry.
  System commitTransaction