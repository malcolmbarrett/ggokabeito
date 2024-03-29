test_that("palette_colors() returns correct vector", {
  expect_equal(
    palette_colors(alpha = 1),
    c("#E69F00FF", "#56B4E9FF", "#009E73FF", "#F0E442FF", "#0072B2FF",
      "#D55E00FF", "#CC79A7FF", "#999999FF", "#000000FF")
  )

  expect_null(names(palette_colors()))

  expect_length(palette_colors(), 9)
})

test_that("palette_okabe_ito() returns correct vector", {
  expect_equal(
    palette_okabe_ito(order = c(2, 3, 5), alpha = 0.9),
    c("#56B4E9E6", "#009E73E6", "#0072B2E6")
  )

  expect_equal(
    palette_okabe_ito(order = c("bluishgreen", "yellow", "blue")),
    c("#009E73", "#F0E442", "#0072B2")
  )

  expect_null(names(palette_okabe_ito()))

  expect_length(palette_okabe_ito(), 9)
  expect_length(palette_okabe_ito(order = c(2, 3, 5)), 3)
})

test_that("palette_okabe_ito() errors correctly", {
  expect_error(
    palette_okabe_ito(order = "bluishgreen", alpha = 1),
    "Cannot use color names for `order` when specifying `alpha`"
  )

  expect_error(
    palette_okabe_ito(order = TRUE),
    "`order` must be an integer vector \\(1\\-9\\) or a character vector"
  )
})
