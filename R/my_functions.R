

#function to compute the stopping condition
stopRule=function(x,y){
  
if (length(x)!=length(y)) {stop("x and y have unequal lengths")
     }
     SR=0
for (i in 1:length(x)){ D=(((x[i]-y[i])^2)/(x[i])^2);SR=SR+D   
 }
print(SR)
}

# function to interpolate and compute the mean envelop
find_Spline=function(...){
  
  max_spl=spline(max_pts)
  
  min_spl=spline(min_pts)
  
  mean_envl=(mean(man_spl)+mean(min_spl))/2 
  residual=curr_data-mean_envel
}


