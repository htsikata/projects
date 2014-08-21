	
	
	/*This implementation finds the root or zero of a polynomial using Newton's method.
	The approximate root is found for a given level of error tolerance */
	
	numeric digits 20
	say
	say 'Enter initial value to search the root from..'
	pull x0
	xcurrent = x0
	tolerance = 10**(-16)        /*error tolerance*/
	diff = 2*tolerance
	
		
	/* Newton's iteration */
	
	do while diff > tolerance
	xnew = xcurrent-func(xcurrent)/deriv(xcurrent)
	diff = (abs(xnew-xcurrent)/(abs(xnew)+tolerance))
	xcurrent = xnew
	end
	say '  The approximate root is ' Xnew
	exit
	
		
	/*procedure to return the function whose zero/root is to be found*/
		
	func: procedure
	x = arg(1)
	return(x**4*(x-2)**3*(x+5)**2)
	
		
	/*procedure to return the derivative of the function (required in newton's)*/
	
	deriv:procedure
	x = arg(1)
	return  x**3*(x-2)**2*(x+5)*(9*x**2+23*x-40) /* derivate of the function is computed manually returned*/

