# make_visual

```
digraph G {
    graph [rankdir=RL]
    node [shape=box, style=solid, margin="0.3,0.1"]
    edge [color="#00000088", dir=back, penwidth=1.2, minlen=1]

    "Makefile"    [style="solid,filled"]
    "src/main.rs" [style="solid,filled"]
    "clean"

    "output.dot" -> "Makefile"
    "output.dot" -> "src/main.rs"
    "all" -> "output.pdf"
    "output.pdf" -> "output.dot"
}

```

![dot_graph](./res/dot_graph.png)

```
digraph G {
  graph [rankdir=RL]
  node [shape=box, style=solid, margin="0.3,0.1"]
  edge [color="#00000088", dir=back, penwidth=1.2, minlen=1]
  "link" -> "compile"
  "clean"
  "api-docs" -> "baz.o"
  "api-docs" -> "bar.o"
  "api-docs" -> "foo.o"
  "schema"
  "package" -> "app"
  "fixtures"
  "app" -> "link"
  "unit" -> "fixtures"
  "user-docs" -> "docs-schema"
  "uninstall"
  "lint" -> "baz.o"
  "lint" -> "bar.o"
  "lint" -> "foo.o"
  "docs" -> "user-docs"
  "docs" -> "api-docs"
  "foo.o" -> "common.h"
  "foo.o" -> "foo.h"
  "foo.o" -> "foo.c"
  "bench-run" -> "bench-setup"
  "common.h"
  "all" -> "docs"
  "all" -> "app"
  "bar.h" -> "common.h"
  "docs-schema" -> "schema"
  "bench-setup"
  "preprocess"
  "install" -> "app"
  "release" -> "sign"
  "release" -> "package"
  "release" -> "docs"
  "release" -> "app"
  "check" -> "integration"
  "check" -> "unit"
  "coverage" -> "unit"
  "compile" -> "preprocess"
  "bench-teardown"
  "foo.h" -> "common.h"
  "baz.o" -> "common.h"
  "baz.o" -> "baz.c"
  "bench" -> "bench-teardown"
  "bench" -> "bench-run"
  "bench" -> "bench-setup"
  "bar.o" -> "common.h"
  "bar.o" -> "bar.h"
  "bar.o" -> "bar.c"
  "test" -> "lint"
  "test" -> "check"
  "codegen" -> "schema"
  "integration" -> "fixtures"
  "sign" -> "package"
  "proto" -> "schema"
}
```

![big_dot_graph](./res/big_dot_graph.png)
