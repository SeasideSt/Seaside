tests
testScaledDecimal
   self
       assert: [ :json |
           json array: [
               json 
						value: 3.14s;
						value: -3s;
						value: 0;
						value: 8 asScaledDecimal ] ]
       gives: '[3.14, -3, 0, 8]'