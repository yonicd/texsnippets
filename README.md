# texsnippets

Add `RStudio` snippets for boilerplate TeX commands

## Installation

```r
remotes::install_github('yonicd/texsnippets')
```

## Setup

To set up the snippets in RStudio run (after running it you must restart the Rstudio IDE)

```r
texsnippets::add_snippets()
```

## Usage

All snippets have a ts (texsnippets) prefix. Write `'ts'` in the `RStudio` source editor and press `tab` button.

```
ts_figure
ts_table
ts_table
ts_tabular
ts_center
ts_array
ts_equation
ts_caption
ts_label
```

## Example

![](readme_gifs/example.gif)
