module M1 {
  var a = 1;
  class C {
    var b = 2;
    proc foo() {
      return a+b;
    }
  }
}

module M2 {
  proc main {
    var c = bar();
    writeln(baz(c));
    delete c;
  }
  proc bar() {
    use M1;
    return new unmanaged C();
  }
  proc baz(obj:RootClass) {
    use M1;
    return (obj:C?)!.foo();
  }
}
