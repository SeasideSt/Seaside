tests
testScaledDecimal
   self
       assert: [ :json |
           json array: [
               json 
						value: (3.14 asScaledDecimal: 2);
						value: (-3 asScaledDecimal: 0);
						value: (0 asScaledDecimal: 0);
						value: (8 asScaledDecimal: 0) ] ]
       gives: '[3.14, -3, 0, 8]'