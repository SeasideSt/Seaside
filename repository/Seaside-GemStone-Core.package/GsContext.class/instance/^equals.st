comparing
= anObject
  ^ anObject class == self class
    and: [ anObject receiver == receiver and: [ anObject method == method ] ]