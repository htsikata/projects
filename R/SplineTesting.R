 
  rm(list = ls())
  source("hilbert_min_max.R")
  #source("CubicSpline.R")
  source("CubicSpline2.R")
  #t = seq(0,10*pi,.01);  #.01
  t=seq(0,80,0.01)
  x = 4*sin(2*pi/40*t)+8*sin(3*pi/40*t)# +9*sin(pi/20)
  #x = sin(pi*t)
  n = length(t);
  r = matrix(x, nrow = n, ncol = 1); # r_0(t) = x(t)
  r1=numeric(0)
  emAll=numeric(0)
  emaxAll=numeric(0)
  eminAll=numeric(0)
  tol=1e-4
  # k= 1;
   resid=r
   
    k= 10  # Iterations
    for (i in 1:k) {
    r=resid 
    MinMax = hilbert_min_max(t,r);                      
    tmin = MinMax$tmin;
    tmax = MinMax$tmax;           
    max_pts = MinMax$max_pts;
    min_pts = MinMax$min_pts;

     Envelope = splineFit(t,x,tmin,tmax,min_pts,max_pts);  # fit spline
    
     emin= Envelope$emin;     eminAll=cbind(eminAll,emin)
     emax = Envelope$emax;    emaxAll=cbind(emaxAll,emax)
     eMean = Envelope$eMean;  emAll=cbind(emAll,eMean)
    
     resid=r-eMean
    # if (abs(mean(resid))<=tol)
    # break
     #r1=x
     x=cbind(x,resid)
    plot(t,x[,i],col=i,type="l",main=paste("plot",i))
    lines(t,emin)
    lines(t,emax)
    lines(t,eMean)
     abline(h=0) 
    points(tmin,min_pts,pch=19,col=2)
    points(tmax,max_pts,pch=19,col=4)
    
    e11=max(eMean)
    e22=(abs(max(resid)))
    print(sprintf("maxmeanEnv=%7.3f,  maxresid=%7.5f",e11,e22))
   # if ((abs(eMean))<=tol)
   #   break
  } 
  
  # plot the original signal and individual iterations
  # plot(x,type="l",col=1,main="Original signal")
  #for (i in 1:k){
  #   windows(8,6)
  #  plot(r1[,i],type="l",lwd=2,main=paste("Iteration",i ),ylab=paste("Residual", i))
  #  lines(emAll[,i],lwd=2,col="blue")
  #  lines(emaxAll[,i],lwd=2,col=3)
  #  lines(eminAll[,i],lwd=2,col=2)
  #  legend("bottom",,ncol=2, c("Residual","mean_Envlp","min_Envlp","max_Envlp"),cex=.8,lwd=c(2,2,2,2),col=c(1,"blue","red",3,2))
  #}
  

