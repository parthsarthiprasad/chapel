use ExampleErrors;

proc test() {
  try {
    writeln("before cobegin block");
    cobegin {
      throw new owned StringError("test error");
      throw new owned StringError("test error");
    }
    writeln("after cobegin block");
  } catch errors: TaskErrors {
    for e in errors { 
      if e != nil {
        writeln("Caught group error e ", e!.message());
      }
    }
  } catch e {
    writeln("Caught other error ", e.message());
  }
}

test();
