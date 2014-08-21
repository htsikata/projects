
rm(list=ls());
require(EMD)

t=seq(0,80,0.01)
x=sin(12*pi*t/20)+sin(8*pi*t/20)
#x = 4*sin(2*pi/40*t)+8*sin(3*pi/40*t)
 #x = 4*sin(2*pi/40*t)+8*sin(3*pi/4*t)
SD=c(sd(x))  ;  tol=0.01

h=numeric(0)
x=x-mean(x)
k=20
for(i in 1:k)  {

t1=seq(1:length(x))

n=length(x) ; t1 = seq(1:n)

First=x[1] ; Second=x[2] ; Last=x[n]
y = extrema(x)
min_pts=x[y$minindex[,1]] ;max_pts=x[y$maxindex[,1]]

tmin=t1[y$minindex[,1]] ; tmax=t1[y$maxindex[,1]]

if (First<=Second){
  min_pts=c(First,min_pts) ; tmin=c(t1[1],tmin) 
}else  
{
  max_pts=c(First,max_pts) ; tmax=c(t1[1],tmax) 
}
if (Last<=x[n-1]){ 
  min_pts=c(min_pts,Last) ; tmin=c(tmin,t1[n])    
}else 
{
  max_pts=c(max_pts,Last) ; tmax=c(tmax,t1[n]) 
}

# compute envelops
fUpper=splinefun(tmax,max_pts) ; upperEnv=fUpper(t1)

fLower=splinefun(tmin,min_pts) ; lowerEnv=fLower(t1)

meanEnv=(upperEnv+lowerEnv)/2

# plot data and envelops

#x11(4,4) ;
plot(x,type="l")

points(tmin,min_pts,col=4, pch=19); points(tmax,max_pts,col=2,pch=19)

lines(t1,upperEnv,col="red") ; lines(t1,lowerEnv,col="blue")

lines(t1,meanEnv,col="green",lwd=2) ;  x = x-(meanEnv)
 
#print(mean(x))
SD=c(SD,sd(x))
print(abs(SD[i]-SD[i+1]))
#print(abs(mean(x)))
if(abs(SD[i]-SD[i+1])<=tol){
  break
}
}

#print(SD)
#print(abs(sd[i]-sd[i+1]))






