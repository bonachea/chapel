use IO;

enum precipitation {mist, sprinkle, drizzle, rain, shower};
var todaysWeather: precipitation = precipitation.sprinkle;

var f = open("_test_fwritelnEnumFile.txt", ioMode.cw).writer(locking=false);

f.writeln(todaysWeather);

f.close();
