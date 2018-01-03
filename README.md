# foodpoints
An R package that allows for easy calculation of weight loss points

## Installation
Open R, and type `devtools::install_github("Prometheus77/foodpoints")`

If that doesn't work, type `install.packages("devtools")` and try again.

## Workflow
Search for your food using `find_food("turkey")`

You'll see a table with potential matches appear. Choose the NDB_No of the best match, and then enter `calc_points("05168")`

This will give the Points Plus value for 100 g of the chose food. For additional options, type `?calc_points`
