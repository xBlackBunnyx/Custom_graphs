####### Custom theme for ggplot #######
#' Custom theme for ggplot2 and Base R graphs
#' @param font_family The name of the font to use (default: "Shadows Into Light Two")
#' @param fallback_font A fallback font if the specified font is unavailable (default: "sans")
#' @export

theme_BB = function(font_family = "Shadows Into Light Two", fallback_font = "sans"){

  # Get a list of installed fonts
  available_fonts = sysfonts::font_families()

  # Check if font is already installed
  if (!(font_family %in% available_fonts)) {
    message(paste("Font", font_family, "not found. Trying to download from Google Fonts..."))

    # Try to add the font from Google Fonts
    tryCatch(
      {
        sysfonts::font_add_google(font_family, font_family)
        message(paste("Font", font_family, "successfully added!"))
      },
      error = function(e) {
        message(paste("Failed to download", font_family, ". Using fallback font:", fallback_font))
        font_family <<- fallback_font  # Use fallback font if download fails
      }
    )
  }

  #Enable showtext globally
  showtext::showtext_auto(enable = TRUE)

  # Apply to base R plots
  graphics::par(
    family = font_family,
    col.main = "black",  # Main title color
    col.axis = "black",  # Axis text color
    col.lab = "black",   # Axis label color
    cex.main = 1.5,      # Title size
    cex.lab = 1.2,       # Label size
    cex.axis = 1.1       # Axis text size
  )

  # Apply to ggplot2 theme
  ggplot2::theme_minimal() %+replace% #replace elements we are going to change

    ggplot2::theme(

      #text elements
      plot.title = ggplot2::element_text(
        family = font_family,
        size = 15,
        face = "bold",
        hjust = 0.5,
        vjust = 2),

      plot.subtitle = ggplot2::element_text(
        family = font_family,
        size = 12),

      plot.caption = ggplot2::element_text(
        family = font_family,
        size = 9,
        hjust = 1),

      axis.title = ggplot2::element_text(
        family = font_family,
        size = 10),

      axis.text = ggplot2::element_text(
        family = font_family,
        size = 9),

      axis.text.x = ggplot2::element_text(margin = margin(5, b = 10)),

      legend.title = ggplot2::element_text(
        family = font_family,
        size = 10,
        face = "bold"
      ),

      legend.text = ggplot2::element_text(
        family = font_family,
        size = 10),

      strip.text = ggplot2::element_text(
        family = font_family,
        size = 10
      )

    )
}

