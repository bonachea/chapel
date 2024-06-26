record TupleType {
  type t;
  var f : t;
}

proc TupleType.init=(const ref other: TupleType(?)) {
  this.t = other.t;
  this.f = other.f;
}
operator TupleType.=(ref lhs: TupleType(?), const ref rhs: TupleType(?)) {
  lhs.f = rhs.f;
}

record AnonTuple {
  var f;
}

operator =(ref a:TupleType(?), b:AnonTuple(?)) {
  a.f = b.f;
}
proc TupleType.init=(from: AnonTuple(?)) {
  this.t = from.f.type;
  this.f = from.f;
  init this;
}
operator :(from: AnonTuple(?), type t: TupleType(?)) {
  var tmp: t = from;
  return tmp;
}

var x = new AnonTuple(f = 1);
var y : TupleType(int);

writeln(x);
writeln(y);

y = x;

writeln(y);
