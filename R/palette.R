#' Okabe-Ito Palette
#'
#' `palette_okabe_ito()` is a wrapper around `palette.colors()` that returns the
#' Okabe-Ito palette in R 4.0.0 or greater. `palette_okabe_ito()` returns an
#' unnamed vector of colors for better use with ggplot2. Additionally, black is
#' the last color returned by `palette_okabe_ito()` when 9 colors are needed
#' instead of the first, as in `palette.colors()`.
#'
#' @param order A numeric vector, the order of the colors, or a character vector
#'   of color names, of: "black", "orange", "skyblue", "bluishgreen", "yellow",
#'   "blue", "vermillion", "reddishpurple", "gray". If `alpha` is not `NULL`,
#'   you must use an integer vector since the colors are not returned with
#'   names.
#' @inheritParams grDevices::palette.colors
#'
#' @return A character vector of hex codes
#' @export
#'
#' @examples
#'
#' palette_okabe_ito()
#'
#' palette_okabe_ito(order = c(2, 3, 5), alpha = 0.9)
#'
#' palette_okabe_ito(order = c("bluishgreen", "yellow", "blue"))
palette_okabe_ito <- function(order = 1:9, alpha = NULL, recycle = FALSE) {
  check_order(order, alpha)
  if (!is.null(alpha)) {
    stopifnot(is.numeric(alpha), alpha >= 0, alpha <= 1)
  }
  stopifnot(is.logical(recycle))

  palette_colors(
    palette = "Okabe-Ito",
    alpha = alpha,
    recycle = recycle,
    order = order
  )
}

check_order <- function(order, alpha) {
  if (is.numeric(order) && all(order > 0)) {
    return(invisible())
  } else if (is.character(order) && all(order %in% color_names())) {
    if (!is.null(alpha)) {
      stop(
        "Cannot use color names for `order` when specifying `alpha`",
        call. = FALSE
      )
    }
    return(invisible())
  } else {
    stop(
      "`order` must be an integer vector (1-9) or ",
      "a character vector of color names (of: ",
      paste(color_names(), collapse = ", "),
      ")",
       call. = FALSE
    )
  }
}

palette_colors <- function(..., order = 1:9) {
  unname(palette.colors(n = 9, ...)[c(2:9, 1)][order])
}

color_names <- function() {
  names(palette.colors(n = 9))
}
