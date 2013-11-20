(TeX-add-style-hook "background"
 (lambda ()
    (TeX-add-symbols
     '("cycccwr" ["argument"] 1)
     '("cyccwr" ["argument"] 1)
     '("cycccwl" ["argument"] 1)
     '("cyccwl" ["argument"] 1)
     "nodesep"
     "cycrad")
    (TeX-run-style-hooks
     "tkz-graph"
     ""
     "latex2e"
     "standalone10"
     "standalone"
     "tikz"
     "crop")))

