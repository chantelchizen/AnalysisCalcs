#' Calculate soil bulk density
#'
#' @import dplyr
#'
#' @param dataset the dataset containing the parameters
#' @param core_diameter the diameter of the core used to take the soil sample (units: cm)
#' @param depth_upper the value of the upper soil depth increment (units: cm)
#' @param depth_lower the value of the lower soil depth increment (units: cm)
#' @param coarse_fragment_weight coarse fragment weight, which includes weight of worms (units: g)
#' @param soil_dry_weight the oven dry weight of the total soil sample (units: g)

#' @return bulk_density the calculated soil bulk density (units: g cm^-3)
#'
#' @export
#'

# calculate bulk density and add to dataframe
bulk_density <- function(dataset, core_diameter, depth_upper, depth_lower, coarse_fragment_weight, soil_dry_weight) {
  enquo(core_diameter) # enquo() refers to specific column in dataframe
  enquo(depth_lower)
  enquo(depth_upper)
  enquo(soil_dry_weight)

  dataset %>%
  mutate(bulk_density = (soil_dry_weight - coarse_fragment_weight) /
    (pi * ((core_diameter / 2)^2) * (depth_lower - depth_upper)))
}
