# teal with non-cdisc data
# 
# ?teal_data
# ?dataset
# Show what the data object looks like
# 
# Let's use a module from teal.modules.general
# ?teal.modules.general -> index
# ?tm_data_table
# use tm_data_table, change the label value to "Data Table Module"
# 
# add header: R/Pharma 2023 teal Workshop

library(teal.modules.general)

app <- init(
  data = teal_data(
    dataset(dataname = "iris", x = iris),
    dataset(dataname = "mtcars", x = mtcars)
  ),
  modules = tm_data_table(label = "Data table mod"),
  header = "R/Pharma 2023 teal Workshop",
  filter = teal_slices(
    teal_slice(dataname = "iris", varname = "Sepal.Length"),
    teal_slice(dataname = "iris", varname = "Species"),
    teal_slice(
      dataname = "mtcars",
      varname = "cyl",
      selected = c(6, 8)
    ),
    teal_slice(
      dataname = "mtcars",
      varname = "gear",
      anchored = TRUE
    ),
    teal_slice(
      dataname = "mtcars",
      varname = "am",
      anchored = TRUE,
      selected = "1"
    ),
    teal_slice("iris",
               expr = "Petal.Length > 4 & Petal.Width > 1",
               id = "customiris",
               title = "My custom filter"),
    count_type = "all"
  )
)

shinyApp(app$ui, app$server)
