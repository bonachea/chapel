record R {
  var x: int;

  proc ref postinit() {
    writeln("R.postinit() x: ", x);
    x = x + 1;
  }
}

var r = new R();

r.postinit();
r.init();
r.postinit();
