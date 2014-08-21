  ########## DATA FRAMES #################
  ## Author: Hayford Tsikata
  
  # Create vectors to be used in a data frame.
  var1 <- c(78,34,76,12,67,56,34,67);
  var2 <- c(45,64,34,25,34,64,74,23);
  var3 <- c(53,67,45,35,74,74,34,74);
  var4 <- c("yes", "no", "no", "yes", "yes", "no","yes","yes");
  var5 <- c(34,64,43,64,63,34,74,73);
  # create dataframe;
  
  df <- data.frame(var1,var2,var3,var4,var5);
  
  str(df);  # take a look at it's features.
  
  colnames(df); names(df);   # col names
  rownames(df);     # check row names
  
  # rename row names // 
  rownames(df) <- c("row1", "row2","row3","row4","row5", "row6", "row7","row8"); #similarly for col names.
  rownames(df)    
  df
  ## extracting variables; Pretend it's a matrix. 
  df[,"var4"] ; df[,4]  # returns a vector of col 4
  df["row1",] ; df[1,]  # returns a vector of row 1
  
  df[,2, drop =FALSE]  # returns col 2 as a data frame instead of a vector.// similar for rows.
  
  # adding observations to data frame. Use rbind() or cbind() depending on row or col.
  
  newData <- c(34,78,53,86,46,86,37,75);   # must have same number of observations.
  
  result <- cbind(df, newData);   # newData added as a col.
  result;
  rowAdd <- c(45,34,53,"no",57,45);   # NB: this vectors contains string cos of "no"
  result2 <- rbind(result,rowAdd);    #  each col of result2 is automatically  converted into strings
  result2
  
  ## removing rows and cols.
  Rmvar2 <-result2[,-2];    ## remove var2 col from result2 data frame.
  Rmvar2
  result2
  RmLastRow <- result2[-9,];
  RmLastRow
  

