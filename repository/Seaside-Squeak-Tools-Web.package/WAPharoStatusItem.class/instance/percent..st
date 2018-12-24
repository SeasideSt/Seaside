private
percent: aDecimal
	^ (GRSequentialPrinter new, (GRNumberPrinter new
			separator: $.;
			precision: 2;
			accuracy: 0.1;
			yourself), ' %') print: aDecimal * 100