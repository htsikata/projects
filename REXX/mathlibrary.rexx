	/*This program is a library of trig functions and others*/ 
	/* It accepts two input values from the user and displays the various computations.*/	
	/*Author: Hayford Tsikata */
	/* fall 2013 */
		
	
	numeric digits 20
	say ' This program accepts two numeric inputs from the user'
	say ' and displays various trignometric computations of first entry'
	say ' In the cases of power, root and general logarithm,'
	say ' The program uses the first entry as the base for the coumputaion'
	 
	say
	say ' Enter the first number a '
	pull a
	say
	say ' Enter the second number n '
	say
	pull n
	say
	say ' The' n'th root of' a 'is' rootfinder(a,n)
	say
	say ' the exponential of' a 'is' exp(a)
	say
	say ' The sine of' a 'is' sin(a)
	say
	say ' The cosine of' a 'is' cos(a)
	say
	say ' The tangent of' a 'is 'tan(a)
	say
	say ' The natural log of' a 'is ' ln(a)
	say

	/*fixes here***********************/
	  
	say ' The cotangent of' a 'is '    cot(a) 
	say
	say ' The secant of' a 'is ' sec(a)
	say
	say ' The cosecant of' a  'is '  cosec(a)
	say
	say ' The natural log  of' n 'is'  ln1(n) 
	say
	say ' The log of' n  'base' a  'is' genlog(a,n)
	say
	say ' 'a 'raised to the power' n 'is ' pow(a,n)
	say
	say ' The inverse sine of' a  'is ' arcsin(a)
	say
	say ' The inverse cosine of' a 'is ' arcos(a)
	say
	say ' The invserse tan of' a 'is ' arctan(a)
	say

	/*fixes end********************** */
	 
	exit
	
	/* procedure for natural logarithm */
	 
	ln: procedure
	a=arg(1)
	if (a<=0) then
	return 'domain error'
	e=exp(1)
	sum=0
	do while (a>e)
	a=a/e
	sum=sum+1
	end
	do while (a<e)
	a=a*e
	sum=sum-1
	end
	xcurrent=1.0
	tolerance=10**(-16)
	diff=2*tolerance
	do while diff > tolerance
	xnew=xcurrent-(exp(xcurrent)-a)/(exp(xcurrent))
	diff=(abs(xnew-xcurrent)/(abs(xnew)+tolerance))
	xcurrent=xnew
	end
	return xnew+sum

       /* procedure for tangent */
	tan : procedure
	x=arg(1)
	return sin(x)/cos(x)


	/* ****fixes here  ******************** */
        /* procedure for arcsine */
        
	arcsin : procedure
	a = arg(1)
	if (a < -1) then 
	return domain error
	if a > 1 then 
	return domain error
	pi=3.141592653589793238462643383279502884
	xcurrent = 0
	tolerance = 10**-16
	diff=2*tolerance
	do while (diff > tolerance)
	xnew=xcurrent-(sin(xcurrent)-a)/(cos(xcurrent))
	diff=(abs(xnew-xcurrent))/((abs(xnew)+tolerance))
	xcurrent=xnew
	end
	do while(xnew > (pi/2))
	xnew = xnew - pi
	end
	do while(xnew < (-pi/2)) 
	xnew = xnew + pi
	end
	return xnew

       /*procedure for arcos */
       
	arcos : procedure
	a = arg(1)
	if a < -1 then 
	return domain error
	if a > 1 then 
	return domain error
	pi = 3.141592653589793238462643383279502884
	xcurrent = pi/2
	tolerance = 10**-16
	diff = 2*tolerance
	do while(diff > tolerance)
	xnew = xcurrent-(cos(xcurrent)-a)/((-sin(xcurrent)))
	diff = (abs(xnew-xcurrent)/(abs(xnew)+tolerance))
	xcurrent = xnew
	end
	do while xnew > pi/2
	xnew = xnew -pi
	end
	do while xnew < -pi/2 
	xnew = xnew  +pi
	end
	return xnew


      /*  procedure for arctangetn*/
      
	arctan : procedure
	a = arg(1)
	pi = 3.141592653589793238462643383279502884
	xcurrent = 0
	tolerance = 10**-16
	diff = 2*tolerance
	do while (diff > tolerance)
	xnew=xcurrent-(tan(xcurrent)-a)/((sec(xcurrent))**2)
	diff = (abs(xnew-xcurrent)/(abs(xnew)+tolerance))
	xcurrent = xnew
	end
	do while xnew > (pi/2)
	xnew = xnew - pi
	end
	do while xnew < (-pi/2) 
	xnew = xnew  +pi
	end
	return xnew
	
     /* Procedure for computing power */
     
	pow : procedure
	a = arg(1)
	n = arg(2)
	if a = 0 then 
	return 0
	if (a <> 0 & n = 0) then
	return 1
	if (a < 0) then 
	return natural log is not defined for a
	return exp((n)*ln(a))

       /* procedure for computing logarithm to any base */
       
	genlog : procedure
	a = arg(1)
	n = arg(2)
	if(((n < 0) | (a <= 0))|(ln(a)==0)) then  /*******/
	return domain error
	else
	return ln(n)/ln1(a)

       /* procedure for contangent*/
       
	cot : procedure
	a = arg(1)
	if sin(a) = 0 then
	return not a number
	return cos(a)/sin(a)

       /*  procedure for secant */
	sec : procedure
	x = arg(1)
	return 1/cos(x)

       /* procedure for cosecant */
	cosec : procedure
	a = arg(1)
	if sin(a) = 0 then 
	return not defined
	return 1/sin(a)
       
       /* logarithm */
       
	ln1: procedure
	n = arg(1)
	if (n <= 0) then
	return 'domain error'
	e = exp(1)
	sum = 0
	do while(n > e)
	n = n/e
	sum = sum+1
	end
	do while (n < e)
	n = n*e
	sum = sum-1
	end
	xcurrent = 1.0
	tolerance = 10**(-16)
	diff = 2*tolerance
	do while(diff > tolerance)
	xnew = xcurrent-(exp(xcurrent)-n)/(exp(xcurrent))
	diff = (abs(xnew-xcurrent)/(abs(xnew)+tolerance))
	xcurrent = xnew
	end
	return xnew+sum

	/* ****fixes end    ************************** */

        /* sine */
	sin:procedure
	x = arg(1)
	sum = 0
	pi = 3.141592653589793238462643383279502884
	do while x>pi  
	x = x-(2*pi)
	end 
	do while(x < -pi)
	x = x+2*pi
	end
	
	
	/*this calculates the taylor series */
	tolerance = 10**-30
	error = 1
	    k = 0
	ak = x**(2*k+1)/(2*k+1)
	do while(error > tolerance)
	sum = sum+ak
	aknew =(-(x*x)/((2*k+3)*(2*k+2)))*ak
	error = abs(aknew)
	ak = aknew
	  k = k+1
	end
	   Taylorsum = sum
	return(Taylorsum)

       /* cosine */
	cos : procedure
	x = arg(1)
	sum = 0
	pi = 3.141592653589793238462643383279502884
	do while(x>pi)  
	x = x -(2*pi)
	end 
	do while(x < -pi)
	x = x+2*pi
	end
	/*this calculates the taylor series */
	tolerance = 10**-35
	error = 1
	  k = 0
	ak=1
	do while (error > tolerance)
	sum = sum+ak
	aknew =  -x*x/((2*k+2)*(2*k+1))*ak
	error = abs(aknew)
	ak = aknew
	k = k+1
	end
	Taylorsum = sum
	return(Taylorsum)

       /* exponential */
       
	exp : procedure
	x = arg(1)
	sum = 0
	e = 2.718281828459045235
	product = 1
	do while(x>1)
	product = product*e
	x = x-1
	end
	do while(x < 0)
	product = product/e
	x = x+1
	end
	/*this calculates the taylor series */
	tolerance = 10**-120
	error = 1
	ak = 1
	k=0
	do while (error>tolerance)
	sum = sum+ak
	aknew = x*ak/(k+1)
	ak = aknew
	error = abs(aknew)
	k = k+1
	end
	TaylorSum = sum
	return(product*TaylorSum)

        /* nth rootfinder */
        
	rootfinder: procedure
	a = arg(1)
	n = arg(2)
	if(n<1) then   
	return not applicable
	xcurrent = 1.0
	tolerance = 10**(-100)
	diff = 2*tolerance
	do while diff > tolerance
	xnew = xcurrent-(xcurrent**n-a)/(n*xcurrent**(n-1))
	diff = (abs(xnew-xcurrent)/(abs(xnew)+tolerance))
	xcurrent = xnew
	end
	return xnew





