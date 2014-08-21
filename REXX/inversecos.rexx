	
	numeric digits 20
	say 'enter initial value'
	pull x0
	xcurrent=0
	tolerance=10**(-16)
	diff=2*tolerance
	do while diff > tolerance
	xnew=xcurrent-func(xcurrent,x0)/deriv(xcurrent)
	diff=(abs(xnew-xcurrent)/(abs(xnew)+tolerance))
	xcurrent=xnew
	end
	say '  the root is' Xnew
	exit

	
	func: procedure
	x0=arg(1)
	a=arg(2)
	return (cos(x0)-a)
	deriv:procedure
	x0=arg(1)
	return(-sin(x0))

	cos : procedure
	x = arg(1)
	sum = 0
	pi = 3.141592653589793238462643383279502884
	/*x= (x*pi/180)*/
	do while  x>pi  
			  x = x - (2*pi)
	end 
	do while   x < - pi
			x = x+2*pi
	end
	/*calculate the Taylor series */
	
	tolerance = 10**-35
	error=1
	k=0
	ak=1
	do while (error > tolerance)
	sum = sum+ak
	aknew =  -x*x/((2*k+2)*(2*k+1))*ak
	error = abs(aknew)
	ak = aknew
	k=k+1
	end
	Taylorsum = sum
	return(Taylorsum)



