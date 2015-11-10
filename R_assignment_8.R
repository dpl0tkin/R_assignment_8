#Problem 1

mammal_sizes <- read.csv("data/MOMv3.3.txt", head = FALSE, sep = "\t", stringsAsFactors = FALSE, na.strings = "-999")

colnames(mammal_sizes) <- c("continent", "status", "order", 
                            "family", "genus", "species", "log_mass", "combined_mass", 
                            "reference")
