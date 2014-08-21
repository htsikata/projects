
 splineFit=function(t,x,tmin,tmax,min_pts,max_pts) {

 fmin = splinefun(tmin, min_pts)

 emin = fmin(t)

 fmax = splinefun(tmax,max_pts)

 emax =  fmax(t)

 eMean = (emin + emax)/2 
 plot(x,type="l")
 lines(emax)
 lines(emin)
 lines(eMean)

 return(list(emin=emin,emax=emax, eMean=eMean))
 }