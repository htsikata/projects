rm(list = ls())
require(WDI)
require(forecast)

## pull data for all needed countries
gdp = WDI(country = c("US", "CA", "GB", "DE", "CN", "JP", "SG", "IL"),
          indicator = c("NY.GDP.PCAP.CD", "NY.GDP.MKTP.CD"),
          start = 1960, end = 2011);
names(gdp) = c("iso2c", "Country", "Year", "PerCapGDP", "GDP");

## pull percapita gdp for the needed countries
us = gdp$PerCapGDP[gdp$Country == "United States"];
china = gdp$PerCapGDP[gdp$Country == "China"];
uk = gdp$PerCapGDP[gdp$Country == "United Kingdom"]
germ = gdp$PerCapGDP[gdp$Country == "Germany"];
japan = gdp$PerCapGDP[gdp$Country == "Japan"];
il = gdp$PerCapGDP[gdp$Country == "Israel"];
singa = gdp$PerCapGDP[gdp$Country == "Singapore"]
canada = gdp$PerCapGDP[gdp$Country == "Canada"]


## set as time series
us = ts(us, start = min(gdp$Year), end = max(gdp$Year));
plot(us, ylab = "Per Capita GDP", xlab = "Year");
acf(us)
pacf(us)
usBest = auto.arima(x = us)
print(usBest)
# Checking whether residuals are white noise
acf(usBest$residuals)
pacf(usBest$residuals)
Forecast = predict(usBest, n.ahead = 10, se.fit = T)
print(Forecast)
ForecastPlot = forecast(object = usBest, h = 10)
plot(ForecastPlot)


## For china
china = ts(china, start = min(gdp$Year), end = max(gdp$Year));
plot(china, ylab = "Per Capita GDP", xlab = "Year");
acf(china)
pacf(china)
chinaBest = auto.arima(x = china)
print(chinaBest)
# Checking whether residuals are white noise
acf(chinaBest$residuals)
pacf(chinaBest$residuals)
Forecast = predict(chinaBest, n.ahead = 10, se.fit = T)
print(Forecast)
ForecastPlot = forecast(object = chinaBest, h = 10)
plot(ForecastPlot)

# For Israel
il = gdp$PerCapGDP[gdp$Country == "Israel"];
il = ts(il, start = min(gdp$Year), end = max(gdp$Year));
plot(il, ylab = "Per Capita GDP", xlab = "Year");
acf(il)
pacf(il)
ilBest = auto.arima(x = il)
print(ilBest)
Forecast = predict(ilBest, n.ahead = 10, se.fit = T)
print(Forecast)
ForecastPlot = forecast(object = ilBest, h = 10)
plot(ForecastPlot)



## For Singapore
singa = ts(singa, start = min(gdp$Year), end = max(gdp$Year));
plot(singa, ylab = "Per Capita GDP", xlab = "Year");
acf(singa)
pacf(singa)
singaBest = auto.arima(x = singa)
print(singaBest)
# Checking whether residuals are white noise
acf(singaBest$residuals)
pacf(singaBest$residuals)
Forecast = predict(singaBest, n.ahead = 10, se.fit = T)
print(Forecast)
ForecastPlot = forecast(object = singaBest, h = 10)
plot(ForecastPlot)


## For Canada
canada = ts(canada, start = min(gdp$Year), end = max(gdp$Year));
plot(canada, ylab = "Per Capita GDP", xlab = "Year");
acf(canada)
pacf(canada)
canadaBest = auto.arima(x = canada)
print(canadaBest)
# Checking whether residuals are white noise
acf(canadaBest$residuals)
pacf(canadaBest$residuals)
Forecast = predict(canadaBest, n.ahead = 10, se.fit = T)
print(Forecast)
ForecastPlot = forecast(object = canadaBest, h = 10)
plot(ForecastPlot)

## This has a problem
## For Japan
japan = ts(japan, start = min(gdp$Year), end = max(gdp$Year));
plot(japan, ylab = "Per Capita GDP", xlab = "Year");
acf(japan)
pacf(japan)
japanBest = auto.arima(x = japan)
print(japanBest)
# Checking whether residuals are white noise
acf(japanBest$residuals)
pacf(japanBest$residuals)
#Forecast = predict(japanBest, n.ahead = 10, se.fit = T)
print(Forecast)
ForecastPlot = forecast(object = japanBest, h = 10)
print(Forecast)
plot(ForecastPlot)

## For Germany
germ = ts(germ, start = min(gdp$Year), end = max(gdp$Year));
germ=germ[11:52]
plot(germ, ylab = "Per Capita GDP", xlab = "Year");
#acf(germ)
#pacf(germ)
germBest = auto.arima(x = germ)
print(germBest)
# Checking whether residuals are white noise
acf(germBest$residuals)
pacf(germBest$residuals)
#Forecast = predict(germBest, n.ahead = 10, se.fit = T)
ForecastPlot = forecast(object = germBest, h = 10)
print(Forecast)
#plot(ForecastPlot)



## For UK 
uk = ts(uk, start = min(gdp$Year), end = max(gdp$Year));
plot(uk, ylab = "Per Capita GDP", xlab = "Year");
acf(uk)
pacf(uk)
ukBest = auto.arima(x = uk)
print(ukBest)
# Checking whether residuals are white noise or not
acf(ukBest$residuals)
pacf(ukBest$residuals)
#Forecast = predict(ukBest, n.ahead = 10, se.fit = T)
ForecastPlot = forecast(object = ukBest, h = 10)
print(Forecast)
plot(ForecastPlot)

