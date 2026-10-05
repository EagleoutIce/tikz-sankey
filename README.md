# `tikz-sankey`, Sankey, alluvial and hand-steered flow diagrams with TikZ

[![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![CI](https://github.com/EagleoutIce/tikz-sankey/actions/workflows/ci.yaml/badge.svg)](https://github.com/EagleoutIce/tikz-sankey/actions/workflows/ci.yaml)

List the flows, get the diagram: `tikz-sankey` places the nodes in columns, sizes and stacks them, orders the bands so that they cross as little as they can, and labels the nodes without letting the labels collide (see the [documentation](https://raw.githubusercontent.com/EagleoutIce/tikz-sankey/gh-pages/build/tikz-sankey-doc.pdf)).

```latex
\usepackage{tikz-sankey}
...
\sankeyDiagram[label={\sankeyName\enspace\sankeyValue}]{
   pizza -> dinner : 4,
   pizza -> fridge : 6,
   cake -> fridge : 3,
   cake -> neighbour : 2,
   fridge -> breakfast : 5,
   fridge -> bin : 4
}
```

- **Input**: `a -> b : 5` lists (chains `a -> b -> c : 5` are alluvia), single `\sankeyFlow`s in loops, CSV files (`\sankeyCSV`), and Mermaid's `sankey-beta` syntax (`sankeymermaid`, `\sankeyMermaid`, `\sankeyMermaidFile`).
- **Layout**: columns computed from the flows (`layout=left|right|center|justify`) or given; `height` or `unit`; `width` fits a diagram with its labels into a length; `column sep=auto` (the default) makes every gap as wide as its labels need; `node sep`, `min pitch`, `skip`, `shift`, `align`, four `direction`s; `name@column` reuses a name in several columns.
- **Colors**: palettes (by Okabe and Ito by default), the same color for the same name in every column, `node color=column` for one hue per column in shades, groups that keep their color through all columns as in [ggalluvial](https://corybrunson.github.io/ggalluvial/) (`flow color=group|source|target|gradient|<color>`), tint, opacity, curvature, flows that fade in or out; presets `alluvial`, `classic`, `energy`, `mermaid`, `values`, `percentages`, `bucket bars`, `black and white`.
- **Labels and numbers**: templates with `\sankeyName`, `\sankeyValue`, `\sankeyShare`, `\sankeyPercentOf`; collision-free placement; leaders; column titles; legends; `siunitx` formatting, prefixes and suffixes.
- **Bucket diagrams**: columns as bars of buckets (`\sankeyColumn[buckets=6]{import}`), flows from bucket to bucket (`import@1 -> clean@2 : 1`), loops within a column.
- **Routes**: bands steered by hand (`forward`, `left`, `right`, `bar`, `arrow`, `\sankeySplit`, `\sankeyMerge`) for diagrams no column layout describes.
- Every node, label and route port is a named TikZ node or coordinate, and `\sankeyNodeInfo` and friends read the layout, so you can draw onto a diagram.

`tikz-sankey` is developed by *Florian Sihler* under the [MIT License](LICENSE). Contributions are welcome (see [CONTRIBUTING.md](CONTRIBUTING.md)).

## Building

- `latexmk` builds `example.tex` and the manual into `build/` and copies only the PDFs next to the sources.
- `l3build check` runs the regression tests (`tests/`) with pdfTeX and LuaTeX, `l3build doc` builds the manual, `l3build ctan` the CTAN archive.
- The CI runs the tests, builds the example and the manual (failing on undefined references) and the CTAN archive for every push and pull request. Pushes to `main` publish the PDFs to `gh-pages`.
- The manual uses [xlistings](https://github.com/EagleoutIce/xlistings) and its `code-link` as a submodule: `git submodule update --init`.
