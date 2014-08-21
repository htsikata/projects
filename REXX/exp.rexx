
        /* This program computes the exponential of a given user declared number*/

	numeric digits 30  /* Number of significant digits to display */	
	say	
	say 'Enter a number to compute its exponential...'	
	pull x	
	say	
	say 'The exponential of' x' is approximately' exponential(x)	
	exit

       /* this procedure computes the exponential*/
	exponential : procedure
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

	/*calculates the Taylor series */
	tolerance=10**-30       /* level of tolearance desired for the approximation */
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
	
	
