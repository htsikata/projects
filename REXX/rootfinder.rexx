	
	/* This program computes a given root of a given number.*/
	
	/* Author: Hayford Tsikata */
	
	/* fall 2013 */
	
	numeric digits 20   /*Specify the number of significant digits to be returned by numeric computations*/
	say
	say ' Enter the number whose root is to be computed...'
	
	pull a
	
	say ' Enter the root you want to compute...'

	pull n
		
	if((Datatype(n,'N') & Datatype(n,'N')) \== 1) then
	do
        say ' Your enteries are invalid. Numeric enteries are required for this calculation'
        say ' Try again'
        exit
	end
	
	if((a<0)|(n<=0)) then
	  
	say ' Your values are invalid . Try again and enter positive numbers'
	 
	else
	
	say' The' n'th root of' a 'is approximately' rootfinder(a,n)
	
	exit
					
        /*This function rootfinder computes the root using newton's method with a preferred tolerance*/ 
       
	rootfinder: procedure
	a=arg(1)
	
	n=arg(2)
	
	xcurrent=1.0

	tolerance=10**(-16)   /*level of tolerance for the computation */

	diff=2*tolerance

	do while diff > tolerance

	xnew = xcurrent-(xcurrent**n-a)/(n*xcurrent**(n-1))

	diff = (abs(xnew-xcurrent)/(abs(xnew)+tolerance))  /*value for stopping the iteration process*/

	xcurrent = xnew

	end

	return xnew





