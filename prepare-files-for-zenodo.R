

library(dplyr)
library(googlesheets4)


tab1 <- read.csv("data/benchmark-meta-analysis-addFile1.csv")
tab3 <- read.delim("data/benchmark-meta-analysis-addFile3.txt", sep="\t")

tab1 <- tab1 %>% left_join(tab3)

write.csv(tab1, "data/benchmark-meta-analysis-addFile1-new.csv")


gs_url <- "https://docs.google.com/spreadsheets/d/1ljxV2bXVSq7ypwFndAnYOFO06akMBA0_8br-wMnYxR8"

z <- googlesheets4::read_sheet(gs_url, col_types="c")

z$`GitHub username of reviewer` <- as.integer(factor(z$`GitHub username of reviewer`))
colnames(z)[2] <- "anonymized_reviewer_ID"

write.table(z, row.names = FALSE, quote = FALSE, sep="\t",
          "data/benchmark-meta-analysis-addFile3-new.txt")
