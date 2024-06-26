use IO;

class myClass {
  var x: int;
  var y: real;
}

var a: unmanaged myClass = new unmanaged myClass(x = 1, y = 2.3);
var myInt: int = 9;
var myFile = open("_test_freadToClassDataMember.txt", ioMode.cwr);
var w = myFile.writer(locking=false);

w.writeln(myInt);
w.close();

var r = myFile.reader(locking=false);
r.read(a.x);
r.close();

writeln("a.x should be equal to 9");
writeln("a.x = ", a.x);

delete a;
