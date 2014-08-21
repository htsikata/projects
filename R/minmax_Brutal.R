
# min max spline fit simulation
# Author: Hayford Tsikata
# summer 2014

    rm(list=ls());
    library(EMD)
    t = seq(0,80,0.01)
    x = sin(2*pi*t/40)+sin(5*pi*t/4)

  #  brutal = function(t,x) {
    n = length(x); t1 = seq(1:n)
    
    first = x[1] ; second = x[2] ; last = x[n] ; y = extrema(x);
    
    min_pts = x[y$minindex[,1]] ;max_pts = x[y$maxindex[,1]];

    tmin = t1[y$minindex[,1]] ; tmax = t1[y$maxindex[,1]];

    if (first<=second){
     min_pts=c(first,min_pts);  tmin=c(t1[1],tmin);
 
    }else  
    {
    max_pts=c(first,max_pts) ; tmax=c(t1[1],tmax) ;
    }
    if (last<=x[n-1]){
  
     min_pts=c(min_pts,last) ; tmin=c(tmin,t1[n])  ;
    }else 
    {
    max_pts=c(max_pts,last); tmax=c(tmax,t1[n]);
  
     }
# return(list(tmin = tmin, min_pts= min_pts, tmax = tmax, max_pts = max_pts,t=t1))

 # }

 # fit spline and compute mean envelops.
  fUpper=splinefun(tmax,max_pts);
    
  upperEnv=fUpper(t1);
    
  fLower=splinefun(tmin,min_pts);
    
  lowerEnv=fLower(t1);
    
  meanEnv=(upperEnv+lowerEnv)/2;
    
# plot data and envelops
  plot(x,type="l",main ="min_max simulation",ylab="function data points");
    
  points(tmin,min_pts,col=4, pch=19); points(tmax,max_pts,col=2,pch=19);
                                             
    
  lines(t1,upperEnv,col="red");
    
  lines(t1,lowerEnv,col="blue");
    
  lines(t1,meanEnv,col="green",lwd=3);





