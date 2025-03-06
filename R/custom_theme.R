####### Custom theme for ggplot #######
#' Custom theme for ggplot2 graphs
#' @export

theme_BB = function(){
  font = "Segoe Print" #Font family

  theme_minimal() %+replace% #replace elements we are going to change

    theme(

      #text elements
      plot.title = element_text(
        family = font,
        size = 15,
        face = "bold",
        hjust = 0.5,
        vjust = 2),

      plot.subtitle = element_text(
        family = font,
        size = 12),

      plot.caption = element_text(
        family = font,
        size = 9,
        hjust = 1),

      axis.title = element_text(
        family = font,
        size = 10),

      axis.text = element_text(
        family = font,
        size = 9),

      axis.text.x = element_text(margin = margin(5, b= 10))
    )
}

