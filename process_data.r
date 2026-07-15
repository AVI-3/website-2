library(tidyverse)

top_songs <- billboard |>
	slice_min(wk1, n = 6, with_ties = FALSE) |>
	pivot_longer(
		starts_with("wk"),
		names_to = "week",
		values_to = "rank",
		values_drop_na = TRUE
	) |>
	mutate(week = readr::parse_number(week))

write_rds(top_songs, file = "clean_data.rds")
