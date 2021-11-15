% Enter your MATLAB Code below
readChId = 12397;
writeChId = 661174;  
writeKey='G6F0PMJE5AM792NO';
[temp,time] = thingSpeakRead(readChId,'Fields',4,'NumPoints',20);
humidity = thingSpeakRead(readChId,'Fields',3,'NumPoints',20);
tempC = (5/9)*(temp-32); 
b = 17.62;
c = 243.5;
gamma = log(humidity/100) + b*tempC./(c+tempC);
dewPoint = c*gamma./(b-gamma)
dewPointF = (dewPoint*1.8) + 32;
thingSpeakWrite(writeChId,[temp,humidity,dewPointF],'Fields',[1,2,3],'TimeStamps',time,'Writekey',writeKey);
% Enter your MATLAB code below
readChId1 = 661174              % Your Channel ID					
readKey = '896O5CKEWYV5E1OC' %Your Read API Key
[dewPointData,timeStamps] = thingSpeakRead(readChId1,'fields',[1,2,3],'NumPoints',100,'ReadKey',readKey);

plot(timeStamps,dewPointData);
xlabel('TimeStamps');
ylabel('Measured Values');
title('Dew Point Measurement');
legend({'Temperature','Humidity','Dew Point'});
grid on;