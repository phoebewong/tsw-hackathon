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

googleform_data_url <- "https://docs.google.com/spreadsheets/d/1YvheIF0pLtNsgE8Zve4Wuf2Ct0_70wO6H0MOdnL6yic/pubhtml"
# googleform_data_url <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vQb-KLDhc30-XgGMGcGw_wpMVney30x7vlPSM6kGpcfD_1sU59x_qg2uEGZDcOrDki_MmZU7X2P0iZg/pubhtml"
# googleform_data_url <- "https://docs.google.com/spreadsheets/d/2PACX-1vQb-KLDhc30-XgGMGcGw_wpMVney30x7vlPSM6kGpcfD_1sU59x_qg2uEGZDcOrDki_MmZU7X2P0iZg/pubhtml"
# googleform_data_url <- "https://docs.google.com/spreadsheets/d/1K5g_3bxsE33T4ZuwUfxmzGY5RXNvQAAP78vis1EHFps/pubhtml"
# https://docs.google.com/spreadsheets/d/2PACX-1vQb-KLDhc30-XgGMGcGw_wpMVney30x7vlPSM6kGpcfD_1sU59x_qg2uEGZDcOrDki_MmZU7X2P0iZg/pubhtml"
