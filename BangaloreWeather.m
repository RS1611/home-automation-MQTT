readChannelID = 12397;

winddir_ID = 1;
windspeed_ID = 2;
rh_ID=3;
temp_ID=4;
rain_ID=5;
pressure_ID=6;
powerlevel_ID=7;
lightint_ID=8;
writeChannelID = 666798;
writeAPIKey = 'GHPXCK3K8W3UGKIP';

winddir= thingSpeakRead(readChannelID, 'Fields', winddir_ID, 'NumMinutes', 10)
windspeed = thingSpeakRead(readChannelID, 'Fields',windspeed_ID, 'NumMinutes', 10)
 rh = thingSpeakRead(readChannelID, 'Fields', rh_ID, 'NumMinutes', 10)
temp = thingSpeakRead(readChannelID, 'Fields', temp_ID, 'NumMinutes', 10)
rain = thingSpeakRead(readChannelID, 'Fields',rain_ID, 'NumMinutes', 10)
pressure = thingSpeakRead(readChannelID, 'Fields', pressure_ID, 'NumMinutes', 10)
powerlevel = thingSpeakRead(readChannelID, 'Fields', powerlevel_ID, 'NumMinutes', 10)
lightint = thingSpeakRead(readChannelID, 'Fields', lightint_ID, 'NumMinutes', 10)

    tStamps = [datetime('now')-minutes(9):minutes(1):datetime('now')]';
    dataTable = table(tStamps, winddir, windspeed, rh, temp, rain,pressure, powerlevel, lightint );
 
    thingSpeakWrite(writeChannelID, dataTable, 'WriteKey', writeAPIKey)