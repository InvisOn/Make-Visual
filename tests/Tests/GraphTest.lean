import Graph
import Std.Data.HashMap


/-- info: { adjacency := Std.HashMap.ofList [("a", [])] } -/
#guard_msgs in
#eval DiGraph.empty {} |>.addEdge "a" none


/-- info: { adjacency := Std.HashMap.ofList [("a", ["b"])] } -/
#guard_msgs in
#eval DiGraph.empty {} |>.addEdge "a" (some "b") 


/-- info: { adjacency := Std.HashMap.ofList [("a", [])] } -/
#guard_msgs in
#eval DiGraph.empty {} |>.addEdges "a" none


/-- info: { adjacency := Std.HashMap.ofList [("a", ["b", "c", "d"]), ("b", [])] } -/
#guard_msgs in
#eval ({ adjacency := Std.HashMap.ofList [("a", ["b"]), ("b", [])]} : DiGraph) |>.addEdges "a" (some ["c", "d"]) 


/-- info: some (Std.HashSet.ofList ["a", "b"]) -/
#guard_msgs in
#eval ({ adjacency := Std.HashMap.ofList [("a", ["b"]), ("b", [])]} : DiGraph).depthFirstSearch "a"
