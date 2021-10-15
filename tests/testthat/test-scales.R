test_that("ggplot2 scales work", {
  library(ggplot2, warn.conflicts = FALSE)
  p1 <- ggplot(mpg, aes(cty, hwy, color = class)) +
    geom_point() +
    scale_color_okabe_ito()

  p2 <- ggplot(mpg, aes(cty, hwy, color = factor(cyl))) +
    geom_point(alpha = 0.7) +
    scale_color_okabe_ito(name = "Cylinders", alpha = .9)

  p3 <- ggplot(mpg, aes(hwy, color = class, fill = class)) +
    geom_density() +
    scale_fill_okabe_ito(name = "Class", alpha = .9) +
    scale_color_okabe_ito(name = "Class")

  p4 <- ggplot(mpg, aes(cty, hwy, color = factor(model))) +
    geom_point() +
    scale_color_okabe_ito()

  expect_error(
    ggplot_build(p4),
    "Insufficient values in manual scale. 38 needed but only 9 provided."
  )

  expect_doppelganger("Scale color", p1)
  expect_doppelganger("Scale color with alpha and name", p2)
  expect_doppelganger("Scale f+c, color alpha, joint name", p3)
})

test_that("ggraph scales work", {
  skip_if_not_installed("ggraph")
  skip_if_not_installed("igraph")
  skip_on_ci()

  # example from https://www.data-imaginist.com/2017/ggraph-introduction-edges/
  library(ggplot2, warn.conflicts = FALSE)
  library(ggraph, warn.conflicts = FALSE)
  library(igraph, warn.conflicts = FALSE)

  graph <- graph_from_data_frame(highschool)
  pop1957 <- degree(delete_edges(graph, which(E(graph)$year == 1957)),
                                                              mode = 'in')
  pop1958 <- degree(delete_edges(graph, which(E(graph)$year == 1958)),
                    mode = 'in')
  V(graph)$pop_devel <- ifelse(pop1957 < pop1958, 'increased',
                                  ifelse(pop1957 > pop1958, 'decreased',
                                         'unchanged'))
  V(graph)$popularity <- pmax(pop1957, pop1958)
  E(graph)$year <- as.character(E(graph)$year)


  p1 <- ggraph(graph, layout = 'kk') +
    geom_edge_link(aes(colour = as.character(year))) +
    scale_edge_color_okabe_ito()

  expect_doppelganger("Edge color", p1)
})
