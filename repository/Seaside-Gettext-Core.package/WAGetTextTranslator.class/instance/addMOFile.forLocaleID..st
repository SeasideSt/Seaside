private
addMOFile: moFile forLocaleID: localeId 
  ^ moFilePerLocaleId
    at: localeId
    put: moFile