#' Okabe-Ito Scales for ggplot2 and ggraph
#'
#' Discrete scales for the colorblind-friendly Okabe-Ito palette, including
#' `color`, `fill`, and `edge_colour`. See [palette_okabe_ito] for
#' details.
#'
#' @inheritParams ggplot2::discrete_scale
#' @inheritParams palette_okabe_ito
#' @inheritParams grDevices::palette.colors
#' @param ... Additonal arguments passed to [ggplot2::discrete_scale()]
#'
#' @return A ggplot or ggraph scale
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(mpg, aes(cty, hwy, color = class)) +
#'   geom_point() +
#'   scale_color_okabe_ito()
#'
#' ggplot(mpg, aes(cty, hwy, color = factor(cyl))) +
#'   geom_point(alpha = 0.7) +
#'   scale_color_okabe_ito(name = "Cylinders", alpha = .9)
#'
#' ggplot(mpg, aes(hwy, color = class, fill = class)) +
#'   geom_density() +
#'   scale_fill_okabe_ito(name = "Class", alpha = .9) +
#'   scale_color_okabe_ito(name = "Class")
scale_okabe_ito <- function(aesthetics, order = 1:9, alpha = 1, ...) {
  values <- palette_okabe_ito(order = order, alpha = alpha, recycle = FALSE)
  pal <- function(n) {
    if (n > length(values)) {
      msg <- paste(
        "Insufficient values in manual scale.", n, "needed but only",
        length(values), "provided."
      )
      stop(msg, call. = FALSE)
    }

    values
  }

  ggplot2::discrete_scale(
    aesthetics = aesthetics,
    scale_name = "manual",
    palette = pal,
    ...
  )
}

#' @rdname scale_okabe_ito
#' @export
scale_colour_okabe_ito <- function(aesthetics = "colour", order = 1:9, alpha = NULL, ...) {
  scale_okabe_ito(
    aesthetics = aesthetics,
    order = order,
    alpha = alpha,
    ...
  )
}

#' @rdname scale_okabe_ito
#' @export
scale_color_okabe_ito <- scale_colour_okabe_ito

#' @rdname scale_okabe_ito
#' @export
scale_fill_okabe_ito <- function(aesthetics = "fill", order = 1:9, alpha = NULL, ...) {
  scale_okabe_ito(
    aesthetics = aesthetics,
    order = order,
    alpha = alpha,
    ...
  )
}

#' @export
#' @name scale_okabe_ito
scale_edge_colour_okabe_ito <- function(aesthetics = "edge_colour", order = 1:9, alpha = NULL, ...) {
  scale_okabe_ito(
    aesthetics = aesthetics,
    order = order,
    alpha = alpha,
    ...
  )
}

#' @export
#' @name scale_okabe_ito
scale_edge_color_okabe_ito <- scale_edge_colour_okabe_ito

