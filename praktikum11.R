dat <- read.csv2("data/praktikum_11_andmed/tamm_saar_koond.csv", header = T, sep = ";", fileEncoding = "UTF-8", quote = "")
library(tidyverse)

head(dat)
dat$Sünnikoht_std2 <- lapply(dat$Sünnikoht_std, function(x) unlist(strsplit(x, ", ")) %>% trimws() %>% gsub(" maakond| vald| kubermang| kirikumõis| mõis| kihelkond", "", .) %>% trimws() %>% rev() %>% paste(., collapse = ", ")) %>% unlist()

lapply(dat$Sünnikoht_std, function(x) unlist(strsplit(x, ", ")) %>% trimws() %>% gsub(" maakond| vald| kubermang| kirkumõis| mõis| kihelkond", "", .) %>% trimws() %>% rev() %>% .[1]) %>% unlist() -> dat$Sünnikoht_std3

names(dat)
dat[c(1:9, 18, 10:17)] -> dat


dat$Sünnikoht_std3 <- gsub(" kirikumõis", "", dat$Sünnikoht_std3)
dat$Sünnikoht_std2 <- gsub(" kirikumõis", "", dat$Sünnikoht_std2)

write.table(dat, "data/praktikum_11_andmed/tamm_saar_koond.csv", quote = F, sep = ";", row.names = F, fileEncoding = "UTF-8")
