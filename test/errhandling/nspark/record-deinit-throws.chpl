use ExampleErrors;
record Wrapper {

  var val: int;
  var err: owned Error?;

  proc init(v: int) {
    val = v;
    err = nil;
  }

  proc ref deinit() throws {
    if err then throw err;
  }

  proc ref oops() {
    err = new owned StringError("called oops()");
  }
}

try {
  var w = new Wrapper(42);
  w.oops();
} catch err {
  writeln(err.message());
}
