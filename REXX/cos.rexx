	
	/*This program computes the cosine of a user declared value in and returns the results in radians */
	/*Author: Hayford Tsikata*/
	/* fall 2013 */
	
	numeric digits 35    /* set Number of significant digits for numeric computations */
	say 'Enter value to calculate the cosine of...'
	pull x	
	if(Datatype(x,'N')\==1) then    /* validate input value */
	do
	say ' Invalid entry!  Entry must be numeric'
	exit
	end
	say ' The cosine of' x 'is' cos(x)
	exit
	
	
	/* procedure to calculate cosine */
	cos : procedure
	x = arg(1)
	sum = 0
	pi = 3.141592653589793238462643383279502884
	/*x= (x*pi/180)*/
	do while  x>pi  
		  x = x - (2*pi)
	end 
	do while(x < - pi)
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
