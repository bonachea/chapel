record R {
  var x: int;
}

record StoresR {
  var x: [1..3] R;

  proc init(arr: [0..2] R = [new R(2), new R(3), new R(4)]) {
    x = arr;
    init this;
  }
}

var storing = new StoresR();
writeln(storing);
