library(tidyverse)
hospital.df <- read.csv("./data/Newhospital_geocoded.csv", header = TRUE, sep = ",", comment.char="",stringsAsFactors = FALSE)
hospital.df$ZIP.Code <- as.character(hospital.df$ZIP.Code)
hospital.df$ZIP.Code <- ifelse(nchar(hospital.df$ZIP.Code) == 4, paste0("0", hospital.df$ZIP.Code), hospital.df$ZIP.Code)
hospital.df$ZIP.Code <- ifelse(nchar(hospital.df$ZIP.Code) == 3, paste0("00", hospital.df$ZIP.Code), hospital.df$ZIP.Code)

hospital.df$full_phone_num <- paste(sep="-", hospital.df$num_1, hospital.df$num_2, hospital.df$num_3)

hospital.df$Hospital.Name.bold <- paste0("<b>", hospital.df$Hospital.Name, "</b>")
hospital.df$pop_content <- paste(sep = "<br/>",
                                 hospital.df$Hospital.Name.bold,
                                 hospital.df$Address.1,
                                 hospital.df$full_phone_num)