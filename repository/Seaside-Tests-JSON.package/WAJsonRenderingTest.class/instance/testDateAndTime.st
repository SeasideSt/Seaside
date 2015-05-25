tests
testDateAndTime
   self
       assert: [ :json |
           | date |
           date := DateAndTime year: 2007 month: 11 day: 21 hour: 14
minute: 42 second: 48 offset: (Duration days: 0 hours: 2 minutes: 0
seconds: 0).
           json array: [
               json dateAndTime: date ] ]
       gives: '["2007-11-21T14:42:48+02:00"]'