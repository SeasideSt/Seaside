tests
testScaledDecimal
   self
       assert: [ :json |
           json array: [
               json 
						value: 3.14s2;
						value: -3 asScaledDecimal;
						value: 0 asScaledDecimal;
						value: 8 asScaledDecimal ] ]
       gives: '[3.14, -3, 0, 8]'