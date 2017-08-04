dat <- read.csv("https://gist.githubusercontent.com/hafen/d75cbb8b2b6047572d2d/raw/e365aa7b187caf42f81694b7f877b55e4584616f/data.R", stringsAsFactors = FALSE)
head(dat)
# install.packages("rbokeh", repos = "http://packages.tessera.io")
library(rbokeh)

figure() %>%
  ly_points(x, y, data = dat)

figure(lod_threshold = 100) %>%
  ly_points(x, y, data = dat)

figure(webgl = TRUE) %>%
  ly_points(x, y, data = dat)


figure() %>%
  ly_hexbin(x, y, data = dat)