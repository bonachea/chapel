class C {
  param a: int;
  param b: int;
  param c: int = 1;
  param d: int = 2;
  param e: int = 3;
}

class D {
  param a: int;
  param b: int;
  var c: borrowed C(a, b);
}

var ownC = new owned C(5, 4, 1, 2, 3);
var c = ownC.borrow();
var ownD = new owned D(5, 4, c);
var d = ownD.borrow();

writeln("{a = ", c.a, ", b = ", c.b, ", c = ", c.c,
        ", d = ", c.d, ", e = ", c.e, "}");
writeln("{a = ", d.a, ", b = ", d.b,
        ", c = {a = ", d.c.a, ", b = ", d.c.b, ", c = ", d.c.c,
        ", d = ", d.c.d, ", e = ", d.c.e, "}}");
