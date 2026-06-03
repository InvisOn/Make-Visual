import Cli
import Std
import Graph


open Cli


def runCommands (p : Parsed) : IO UInt32 := do
  let stdin <- IO.getStdin
  let input <- stdin.readToEnd

  let mut graph := parseMakeP input

  if let some node := p.flag? "keep-lineage" then
    match graph.getLineageNode node.value with
      | none => 
        IO.eprintln s!"Cannot keep only the lineage {node.value} because it was not found in the Makefile DAG"
        return 1
      | some lineage => 
        graph := graph.getSubGraph lineage

  if let some node := p.flag? "prune-lineage" then
    match graph.getLineageNode node.value with
      | none => 
        IO.eprintln s!"Cannot prune the lineage {node.value} because it was not found in the Makefile DAG"
        return 1
      | some lineage => 
        graph := graph.pruneLineage lineage

  -- TODO: add highlighting
  if let some node := p.flag? "highlight-lineage" then
    match graph.getLineageNode node.value with
      | none => 
        IO.eprintln s!"Cannot highlight {node.value} because it was not found in the Makefile DAG"
        return 1
      | some lineage => 
        let _lineage := lineage

  return 0



def setupCommands : Cmd := `[Cli|
  make_lineage VIA runCommands; ["0.0.1"]
  "Parse Makefile database to dot"

  FLAGS:
    p, "prune-lineage"     : String;  "Prune DAG of the given node's lineage. Has precedence over --keep-lineage"
    k, "keep-lineage"      : String;  "Keep only the given node's lineage."
    l, "highlight-lineage" : String;  "Highlight the given node's lineage."
]

