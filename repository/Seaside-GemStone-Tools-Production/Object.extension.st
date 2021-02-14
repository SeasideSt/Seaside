Extension { #name : #Object }

{ #category : #'*seaside-gemStone-tools-production' }
Object >> inspectorFields [
  | members |
  members := Array new writeStream.
  self class allInstVarNames
    withIndexDo: [ :each :index | members nextPut: each -> (self instVarAt: index) ].
  self dynamicInstanceVariables
    withIndexDo: [ :each :index | members nextPut: ('*' , each) -> (self dynamicInstVarAt: each) ].
  self class isVariable
    ifTrue: [ 1 to: self size do: [ :index | members nextPut: index -> (self at: index) ] ].
  ^ members contents
]
