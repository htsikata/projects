hilbert_min_max = function(t,x)
{
  require(seewave)
  x = x-mean(x)
  
  # plot signal and hilbert phase 
  #plot(t,x,type='l',lty=1,col="black",lwd=2)
 # abline(h=0)         #construct a horizontal line through 0
  
  # finding the min of x
  h = hilbert(x,0)        # hilbert transform
  phase = Arg(h)          #hilbert phase
  
  idx = seq(1,length(t),1)
  D = diff(phase)
  min_idx = idx[abs(D)>pi]
  tmin = t[min_idx]
  min_pts = x[min_idx]
  #points(tmin,min_pts,pch=0,lwd=4,col=2)
  
  # finding the max of y
  x = -x
  
  h = hilbert(x,0)        # hilbert transform
  phase = Arg(h)          #hilbert phase
  
  idx = seq(1,length(t),1)
  D = diff(phase)
  max_idx = idx[abs(D)>pi]
  tmax = t[max_idx]
  max_pts = -x[max_idx]
  #points(tmax,max_pts,pch=0,lwd=4,col=4)
  
  return(list(tmin = tmin, min_pts = min_pts, tmax = tmax, max_pts = max_pts))
}