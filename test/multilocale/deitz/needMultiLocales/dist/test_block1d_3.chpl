use BlockDist;

config var n = 8, tpl=1;

var Dist = new blockDist(rank=1, boundingBox={2..n-1},dataParTasksPerLocale=tpl);
var Dom: domain(1) dmapped Dist = {-n..n};
var A: [Dom] real;

writeln(Dom);
writeln(A);
writeln();
writeln("element locales");
on Locales(1) {
  for i in Dom {
    write(A(i).locale.id, " ");
  }
}

var j = 1;
for a in A {
  a = j;
  j += 1;
}
writeln();
writeln("initialized array");
writeln(A);

forall i in Dom with (ref A) do {
  A(i) = 0;
}

writeln();
writeln("parallel zeroed array");
writeln(A);

forall a in A do {
  a = 1;
}

writeln();
writeln("parallel array iteration");
writeln(A);
