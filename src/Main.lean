import Command


def main (args : List String) : IO UInt32 := do
  setupCommands.validate args

