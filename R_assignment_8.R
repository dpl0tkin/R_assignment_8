#Problem 1
library(dplyr)

mammal_sizes <- read.csv("data/MOMv3.3.txt", head = FALSE, sep = "\t", stringsAsFactors = FALSE, na.strings = "-999")

colnames(mammal_sizes) <- c("continent", "status", "order", 
                            "family", "genus", "species", "log_mass", "combined_mass", 
                            "reference")

#Problem 2

#Make new table with just columns of interest
mammal_mass_data <- select(mammal_sizes, continent, status, combined_mass)
#Create separate tables for extant and extinct taxa
extant_mamm <- filter(mammal_mass_data, status == "extant")
extinct_mamm <- filter(mammal_mass_data, status == "extinct")
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

#Problem 3

#Calculate mean weight per continent for extant & extinct mammals
extant_mamm_cont <- group_by(extant_mamm, continent)
avg_extant_mass_cont <- summarize(extant_mamm_cont, avg_extant_mass_cont = mean(combined_mass))
colnames(avg_extant_mass_cont) <- c("continent","extant")

extinct_mamm_cont <- group_by(extinct_mamm, continent)
avg_extinct_mass_cont <- summarize(extinct_mamm_cont, avg_extinct_mass_cont = mean(combined_mass))
colnames(avg_extinct_mass_cont) <- c("continent","extinct")

#Join extant and extinct tables, and export
avg_all_mass_cont <- full_join(avg_extant_mass_cont, avg_extinct_mass_cont)
write.csv(avg_all_mass_cont, file = "continent_mass_differences.csv")
