hospital.df$full_address <- paste(hospital.df$Address.1, hospital.df$Address.2, hospital.df$Address.3)
hospital.df$full_address <- paste(hospital.df$full_address, hospital.df$City, hospital.df$State, sep = ", ")

hospital.df$full_address <- gsub("NA, ", "", hospital.df$full_address)

hospital.df$pop_content <- paste(sep = "<br/>",
                                                  hospital.df$Address.1,
                                                  hospital.df$Phone.Number)
# Geocode the hospital address
# Geocoding a csv column of "addresses" in R
#load ggmap
library(ggmap)

# Select the file from the file chooser
fileToLoad <- file.choose(new = TRUE)

# Read in the CSV data and store it in a variable 
origAddress <- read.csv(fileToLoad, stringsAsFactors = FALSE)

# Initialize the data frame
geocoded <- data.frame(stringsAsFactors = FALSE)

# Loop through the addresses to get the latitude and longitude of each address and add it to the
# origAddress data frame in new columns lat and lon
for(i in 26:nrow(hospital.df))
{
  print(i)
  if (i%%5 == 0){
    Sys.sleep(60)
  } else {
    Sys.sleep(15)
    result <- try(geocode(hospital.df$full_address[i], output = "latlona", source = "google"))
    hospital.df$lon[i] <- as.numeric(result[1])
    hospital.df$lat[i] <- as.numeric(result[2])
    hospital.df$geoAddress[i] <- as.character(result[3])  
  }
}

for(i in 67:nrow(boston)){
  print(i)
  if (i%%5 == 0){
    Sys.sleep(60)
  } else {
    Sys.sleep(15)
    result <- try(geocode(boston$full_address[i], output = "latlona", source = "google"))
    boston$lon[i] <- as.numeric(result[1])
    boston$lat[i] <- as.numeric(result[2])
    boston$geoAddress[i] <- as.character(result[3])  
  }
}

for (i in 26:nrow(boston)){
  print(i)
  if (i%%5 == 0){
    Sys.sleep(60)
  } else {
    Sys.sleep(15)
    result <- try(geocode(boston$full_address[i], output = "latlona", source = "google"))
    boston$lon[i] <- as.numeric(result[1])
    boston$lat[i] <- as.numeric(result[2])
    boston$geoAddress[i] <- as.character(result[3])  
  }
}
# Write a CSV file containing origAddress to the working directory
write.csv(origAddress, "geocoded.csv", row.names=FALSE)