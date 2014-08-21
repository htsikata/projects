
##    h phase

library(seewave)
t = seq(0,80,.01)
y = sin(pi * t/40) + sin(2* pi * t/40) + sin(6 * pi * t/40)

hil = function(y)       ## t is a free variable
{
  y = y-mean(y) 
  
  h = hilbert(y,0)        
  phase = Arg(h)          
  
  idx = seq(1,length(t),1)
  D = diff(phase)
  minindex = idx[abs(D)>pi]  
  tmin = t[minindex]
  min_pts = y[minindex]  
  y = -y
  h = hilbert(y,0)       
  phase = Arg(h)         
  idx = seq(1,length(t),1)
  D = diff(phase)
  maxindex = idx[abs(D)>pi]   
  tmax = t[maxindex]
  max_pts = -y[maxindex]
  nextreme=length(maxindex)+length(minindex)
  #****************
  minindex=(cbind(minindex,minindex, deparse.level=0));
  maxindex=(cbind(maxindex,maxindex, deparse.level=0));
  #*****************
  #points(tmax,max_pts,pch=0,lwd=4,col=4)
  return(list(minindex=minindex, maxindex=maxindex,nextreme=nextreme));
}



