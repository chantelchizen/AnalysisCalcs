rm(list = ls())

library(dplyr)

#### Load Data Files ####

# open existing bulk density raw data file
#bd_raw <- read.csv('~/Git/code/WetlandCarbonSurvey/data-raw/wcs_bulk_density_raw.csv')
#bd_raw <- read.csv('~/Git/code/WetlandDrainage/data-raw/drn_bulk_density_raw.csv')

# change sample_number to character class
bd_raw$sample_number <- as.character(bd_raw$sample_number)

# open existing coarse fragments raw data file
cf <- read.csv('/Users/chantel/OneDrive - University of Saskatchewan/phd_project/data/coarse_fragments.csv')

#### Combine Data Frames ####

# join the bulk density and coarse fragment dataframes by sample number
bd_cf <- left_join(bd_raw, cf, by = c("sample_number"))

bd_cf$coarse_fragment_weight.x[is.na(bd_cf$coarse_fragment_weight.x)] = 0
bd_cf$coarse_fragment_weight.y[is.na(bd_cf$coarse_fragment_weight.y)] = 0

#### Update Table Values ####

# update the lower depth value from the cf data sheet
bd_cf$depth_lower.x <- ifelse(is.na(bd_cf$depth_lower.y),
                              bd_cf$depth_lower.x,
                              bd_cf$depth_lower.y)

bd_cf$coarse_fragment_weight.sum <- bd_cf$coarse_fragment_weight.x + bd_cf$coarse_fragment_weight.y
bd_cf$coarse_fragment_weight.x <- bd_cf$coarse_fragment_weight.sum

bd_cf$notes.x <- ifelse(is.na(bd_cf$notes.y), bd_cf$notes.x, bd_cf$notes.y)

# rename '.x' columns to remove the '.x' and remove the '.y' columns

bd_cf <- bd_cf %>%
  rename(
    depth_lower = depth_lower.x,
    coarse_fragment_weight = coarse_fragment_weight.x,
    notes = notes.x
  ) %>%
  subset(select = -c(depth_lower.y, coarse_fragment_weight.y, notes.y, coarse_fragment_weight.sum))

bd_cf <- bd_cf[order(bd_cf$sample_number),]

#### Save New Raw Data File ####

#write.csv(bd_cf, '~/Git/code/WetlandCarbonSurvey/data-raw/wcs_bulk_density_raw.csv')
#write.csv(bd_cf, '~/Git/code/WetlandDrainage/data-raw/drn_bulk_density_raw.csv')
