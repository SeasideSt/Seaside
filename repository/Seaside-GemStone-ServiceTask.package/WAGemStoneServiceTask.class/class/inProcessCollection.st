accessing
inProcessCollection
  "sorted inProcess"

  ^ (self inProcess collect: [ :each | each ]) sortBy: [ :a :b | a id < b id ]