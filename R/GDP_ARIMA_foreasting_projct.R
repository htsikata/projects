
# Time series analysis and forecasting 
# Forecasting percapita GDP for selected countries
# Analyst: Hayford Tsikata
# Spring 2014
# Data obtained from the WDI package.

rm(list = ls())
library(WDI)
library(forecast)

gdp <-WDI(country = c("US", "CA", "GB", "DE", "CN", "JP", "SG", "IL"),
          indicator = c("NY.GDP.PCAP.CD", "NY.GDP.MKTP.CD"),
          start = 1960, end = 2011);
names(gdp)<- c("iso2c", "Country", "Year", "PerCapGDP", "GDP"); 

CounTries <- c("United States", "China", "Israel" ,"Canada", "Japan" ,"Germany", "United Kingdom","Singapore")

##loop through CountTries ##
for (i in CounTries){
        country_gdp = gdp$PerCapGDP[gdp$Country == i];
        if(i=="Germany"){
                country_gdp=na.omit(country_gdp)
        }
        country_gdp <- ts(country_gdp, start = min(gdp$Year), end = max(gdp$Year));
        #plot(country_gdp, ylab = "Per Capita GDP", xlab = "Year",main=paste("percap_gdp for",i));
        BestModel <- auto.arima(x = country_gdp)
        ForecastPlot <- forecast(object = BestModel, h = 10)
        plot(ForecastPlot,xlab="year", ylab="percapita GDP",main=paste("Forecast plot for",i))
        cat("\n Ten years ahead forecasts for",i," are \n\n")
        
        print(ForecastPlot$mean)
}



