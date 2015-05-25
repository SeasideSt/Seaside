release
releaseSeaside30
  "use indirection here, to avoid undefined symbols and sent but not implemented errors
  in GemStone tests ... not even sure that this method is being used anymore."

  {#'ConfigurationOfPierAddOns2'.
  #'ConfigurationOfPier2'.
  #'ConfigurationOfMagritte2'.
  #'ConfigurationOfGrease'.
  #'ConfigurationOfSeaside30'.
  #'ConfigurationOfKomHttpServer'}
    do: [ :className | 
      Smalltalk
        at: className
        ifPresent: [ :cl | 
          (cl respondsTo: #'releaseToSqueakSource')
            ifTrue: [ cl perform: #'releaseToSqueakSource' ].
          (cl respondsTo: #'releaseToGemSource')
            ifTrue: [ cl perform: #'releaseToGemSource' ] ] ]