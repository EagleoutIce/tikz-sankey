# `tikz-sankey`, Sankey diagrams with TikZ

[![LPPL 1.3c](https://img.shields.io/badge/License-LPPL%201.3c-yellow.svg)](https://www.latex-project.org/lppl.txt) [![CI](https://github.com/EagleoutIce/tikz-sankey/actions/workflows/ci.yaml/badge.svg)](https://github.com/EagleoutIce/tikz-sankey/actions/workflows/ci.yaml)

List the flows, get the diagram: `tikz-sankey` computes the columns, stacks and sizes the nodes, orders the bands and places the labels so that they do not collide. See the [documentation](https://raw.githubusercontent.com/EagleoutIce/tikz-sankey/gh-pages/build/tikz-sankey-doc.pdf) for everything else.

```latex
\usepackage{tikz-sankey}
...
\sankeyDiagram[label={\sankeyName\space\sankeyValue}]{
   pizza -> dinner : 4,
   pizza -> fridge : 6,
   cake -> fridge : 3,
   cake -> neighbour : 2,
   fridge -> breakfast : 5,
   fridge -> bin : 4
}
```

![The diagram of the code above](https://raw.githubusercontent.com/EagleoutIce/tikz-sankey/gh-pages/readme-example-1.png)

```latex
\sankeyDiagram[black and white]{
   books -> read : 5,
   books -> lent : 3,
   books -> shelf : 2,
   books -> lost : 2,
   read -> kept : 1,
   read -> sold : 4
}
```

![The diagram of the code above, in black and white](https://raw.githubusercontent.com/EagleoutIce/tikz-sankey/gh-pages/readme-example-2.png)

## Building

- `latexmk` builds `example.tex`, the manual and the pictures of this README into `build/`.
- `l3build check` runs the regression tests, `l3build ctan` builds the CTAN archive.
- The manual uses [xlistings](https://github.com/EagleoutIce/xlistings) as a submodule: `git submodule update --init`.

## License

`tikz-sankey` is developed by *Florian Sihler* under the [LaTeX Project Public License 1.3c](LICENSE). Its extraction from earlier code was assisted by Claude. Contributions are welcome (see [CONTRIBUTING.md](CONTRIBUTING.md)).
