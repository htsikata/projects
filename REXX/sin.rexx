	
	/* This program computes the sine and inverse sine of a user declared value in radians*/
	/* Author: Hayord Tsikata*/
	/* fall 2013 */
	
	numeric digits 30     /* Number of significant digits to return */
	say 'Enter a value to compute its sin and inverse sine...'
	pull x
	if(Datatype(x,'N')\==1) then
	do
	say ' Invalid entry!  Entry must be numeric'
	exit
	end
	
	say ' The sine of ' x ' is approximately' sin(x)
	if(sin(x)\==0) then
	say ' The inverse sine is approximately' 1/sin(x)    /*display the inverse sine if sin(x) is not zero*/
	else 
	say ' Inverse sine in not a number.'
	exit
	
	/* procedure to calculate sin*/
	sin:procedure
	x = arg(1)
	sum = 0
	pi = 3.141592653589793238462643383279502884
	/*x = (x*pi/180)*/
	do while x>pi  
	     x = x-(2*pi)
	end 
	do while x<-pi
		x = x+2*pi
	end
		
	/* calculate The taylor series approximation */
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


