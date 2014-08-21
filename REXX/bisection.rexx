
	say  
	numeric digits 20

	say ' enter left boundary'
	say
	pull a
	say
	say'enter right boundary'
	pull b
	say
	say 'enter num of iteration'
	pull N
	fa= func(a)
	fb=func(b)
	if (fa*fb> 0) then do
	say 'error : bad interval'
	end
	if (fa==0) then do
	say'the zero is' a
	exit
	end

	if (fb==0) then do
	say 'the root is ' b
	exit
	end

	do k=1 to N
	c = (a+b)/2
	fc = func(c)
	if (fc==0) then do
	say 'the zero is' c
	exit 
	end

	if (fa*fc<0) then do
	b=c
	fb=fc
	end

	if (fb*fc<0) then do
	a=c
	fa=fc
	end 
	end
	say 'the approximate zero is ' c
	exit
	
	/* the function to compute */
	
	func : procedure
	x= arg(1)
	return (exp(x)-x*x)



        /* procedure for the natural log*/
        
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
	do while (a < e )
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


	tan : procedure
	x=arg(1)
	return sin(x)/cos(x)


	/****** fixes begin here  *********************/

	arcsin : procedure
	a = arg(1)
	if a<-1 then 
	return domain error
	if a>1 then 
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
	do while xnew > (pi/2)
	xnew = xnew - pi
	end
	do while xnew < (-pi/2) 
	xnew = xnew  +pi
	end
	return xnew



	arcos : procedure
	a = arg(1)
	if a<-1 then 
	return domain error
	if a>1 then 
	return domain error
	pi=3.141592653589793238462643383279502884
	xcurrent = pi/2
	tolerance = 10**-16
	diff=2*tolerance
	do while (diff > tolerance)
	xnew=xcurrent-(cos(xcurrent)-a)/((-sin(xcurrent)))
	diff=(abs(xnew-xcurrent)/(abs(xnew)+tolerance))
	xcurrent=xnew
	end
	do while xnew > pi/2
	xnew = xnew -pi
	end
	do while xnew < -pi/2 
	xnew = xnew  +pi
	end
	return xnew



	arctan : procedure
	a = arg(1)
	pi=3.141592653589793238462643383279502884
	xcurrent = 0
	tolerance = 10**-16
	diff=2*tolerance
	do while (diff > tolerance)
	xnew=xcurrent-(tan(xcurrent)-a)/((sec(xcurrent))**2)
	diff=(abs(xnew-xcurrent)/(abs(xnew)+tolerance))
	xcurrent=xnew
	end
	do while xnew > (pi/2)
	xnew = xnew - pi
	end
	do while xnew < (-pi/2) 
	xnew = xnew  +pi
	end
	return xnew




	pow : procedure
	a=arg(1)
	n=arg(2)
	if a=0 then 
	return 0
	if (a<>0 & n=0) then
	return 1
	if a<0 then 
	return ln is not defined for a
	return exp((n)*ln(a))


	genlog : procedure
	a=arg(1)
	n=arg(2)
	if n<0 | a<=0 then 
	return domain error
	return ln(n)/ln1(a)


	cot : procedure
	a=arg(1)
	if sin(a)=0 then
	return not defined
	return cos(a)/sin(a)


	sec : procedure
	x = arg(1)
	return 1/cos(x)


	cosec : procedure
	a=arg(1)
	if sin(a)=0 then 
	return not defined
	return 1/sin(a)


	ln1: procedure
	n=arg(1)
	if (n<=0) then
	return 'domain error'
	e=exp(1)
	sum=0
	do while (n>e)
	n=n/e
	sum=sum+1
	end
	do while (n<e)
	n=n*e
	sum=sum-1
	end
	xcurrent=1.0
	tolerance=10**(-16)
	diff=2*tolerance
	do while diff > tolerance
	xnew=xcurrent-(exp(xcurrent)-n)/(exp(xcurrent))
	diff=(abs(xnew-xcurrent)/(abs(xnew)+tolerance))
	xcurrent=xnew
	end
	return xnew+sum

	/***** my fixes end    ***************************/


	sin:procedure
	x = arg(1)
	sum = 0
	pi = 3.141592653589793238462643383279502884
	do while x>pi  
	x = x-(2*pi)
	end 
	do while x<-pi
	x = x+2*pi
	end
	/*this calculates the taylor series */
	tolerance = 10**-30
	error=1
	  k=0
	ak =x**(2*k+1)/(2*k+1)
	do while (error > tolerance)
	sum = sum+ak
	aknew =(-(x*x)/((2*k+3)*(2*k+2)))*ak
	error = abs(aknew)
	ak = aknew
	  k=k+1
	end
	   Taylorsum =sum
	return(Taylorsum)


	cos : procedure
	x = arg(1)
	sum = 0
	pi = 3.141592653589793238462643383279502884
	do while  x>pi  
	x = x -(2*pi)
	end 
	do while   x < -pi
	x = x+2*pi
	end
	/*this calculates the taylor series */
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
	Taylorsum =sum
	return(Taylorsum)


	exp : procedure
	x=arg(1)
	sum=0
	e=2.718281828459045235
	product=1
	do while x>1
	product=product*e
	x=x-1
	end
	do while x<0
	product=product/e
	x=x+1
	end
	/*this calculates the taylor series */
	tolerance=10**-120
	error=1
	ak=1
	k=0
	do while (error>tolerance)
	sum=sum+ak
	aknew=x*ak/(k+1)
	ak=aknew
	error=abs(aknew)
	k=k+1
	end
	TaylorSum=sum
	return(product*TaylorSum)


	rootfinder: procedure
	a=arg(1)
	n=arg(2)
	if n<1 then   /*making sure n is a whole #  */ 
	return not applicable
	xcurrent=1.0
	tolerance=10**(-100)
	diff=2*tolerance
	do while diff > tolerance
	xnew=xcurrent-(xcurrent**n-a)/(n*xcurrent**(n-1))
	diff=(abs(xnew-xcurrent)/(abs(xnew)+tolerance))
	xcurrent=xnew
	end
	return xnew





