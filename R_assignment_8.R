#Problem 1
library(dplyr)

mammal_sizes <- read.csv("data/MOMv3.3.txt", head = FALSE, sep = "\t", stringsAsFactors = FALSE, na.strings = "-999")

colnames(mammal_sizes) <- c("continent", "status", "order", 
                            "family", "genus", "species", "log_mass", "combined_mass", 
                            "reference")

#Problem 2

#Create separate tables for extant and extinct taxa
extant_mamm <- filter(mammal_sizes, status == "extant")
extinct_mamm <- filter(mammal_sizes, status == "extinct")
#Remove null combined_mass values
extant_mamm <- na.omit(extant_mamm)
extinct_mamm <-na.omit(extinct_mamm)

#calculate and print mean masses
extant_mass = extant_mamm[["combined_mass"]]
avg_extant_mass <- mean(extant_mass)

extinct_mass = extinct_mamm[["combined_mass"]]
avg_extinct_mass <- mean(extinct_mass)

print(avg_extant_mass)
print(avg_extinct_mass)