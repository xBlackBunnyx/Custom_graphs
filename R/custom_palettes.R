####### Custom palettes for ggplot #######
#' Custom palette for ggplot2 graphs
#' @export


BB_colors = c(
  #Blues
  blue1 = "#98F5FF",
  blue2 = "#87CEFA",
  blue3 = "#00BFFF",
  blue4 = "#1874CD",
  blue5 = "#191970",
  #Cyans
  cyan1 = "#48D1CC",
  cyan2 = "#00CDCD",
  cyan3 = "#20B2AA",
  cyan4 = "#008B8B",
  #Greens
  green1 = "#B4EEB4",
  green2 = "#90EE90",
  green3 = "#A2CD5A",
  green4 = "#6B8E23",
  green5 = "#228B22",
  #Pinks
  pink1 = "#DB7093",
  pink2 = "#CD6090",
  pink3 = "#B63060",
  pink4 = "#8B3A62",
  pink5 = "#8B0A50",
  #Purples
  purple1 = "#DDA0DD",
  purple2 = "#8968CD",
  purple3 = "#8470FF",
  purple4 = "#BA55D3",
  purple5 = "#68228B"
)

#' @export
BB_cols = function(...) {
  cols = c(...)

  if (is.null(cols))
    return(BB_colors)

  BB_colors[cols]
}

BB_palettes = list(
  main = BB_cols("blue3", "cyan3", "green3", "pink3", "purple3"),

  blues = BB_cols("blue1","blue2","blue3","blue4","blue5"),

  cyans = BB_cols("cyan1","cyan2","cyan3","cyan4"),

  greens = BB_cols("green1","green2","green3","green4","green5"),

  pinks = BB_cols("pink1","pink2","pink3","pink4","pink5"),

  purples = BB_cols("purple1","purple2","purple3","purple4","purple5"),

  mixed = BB_cols("green3", "green5", "cyan1", "blue1", "blue2", "purple2")
)

#' @export
BB_pal = function(palette = "main", reverse = FALSE, ...) {
  pal = BB_palettes[[palette]]

  if (reverse) pal = rev(pal)

  colorRampPalette(pal, ...)
}

#' Function to use custom colors in ggplot2
#' @export

scale_color_BB = function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal = BB_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("BB_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' @export
scale_fill_BB = function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal = BB_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("BB_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
