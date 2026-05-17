
def getStdin : IO String := do
  let stdin <- IO.getStdin
  return (<- stdin.readToEnd)

-- TODO; add --reverse_edges -r
-- TODO; a good way to specify only including dependencies and/or ancestors of one or multiple nodes
-- TODO; add --dependencies -d
-- TODO; add --targets -t
-- TODO; add --layout TB|BT|LR|RL

