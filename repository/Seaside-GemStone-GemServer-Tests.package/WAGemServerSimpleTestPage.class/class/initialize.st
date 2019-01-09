initialization
initialize
  "self initialize"

  (WAAdmin register: self asApplicationAt: 'tests/gemServerSimple')
    preferenceAt: #'sessionClass'
    put: WASession