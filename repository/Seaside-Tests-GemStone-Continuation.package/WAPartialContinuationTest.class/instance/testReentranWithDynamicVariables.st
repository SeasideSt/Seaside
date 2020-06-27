testing
testReentranWithDynamicVariables
  | kk |
  self
    assert:
      (self
        mark: [ 
          2
            *
              (self
                callcc: [ :cc | 
                  kk := cc.
                  2 ]) ])
        = 4.
  WADynamicVariable
    use: 6
    during: [ 
      self assert: (self mark: [ kk value: WADynamicVariable value ]) = 12.
      self assert: (self mark: [ kk value: WADynamicVariable value ]) = 12.
      self assert: (self mark: [ kk value: WADynamicVariable value ]) = 12 ]