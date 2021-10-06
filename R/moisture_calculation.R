#' Calculate soil moisture and total soil dry weight
#'
#' @param tin_soil_wet_weight the weight of the field moist soil and tin for soil moisture (units: g)
#' @param tin_soil_dry_weight the weight of the oven dry soil and tin for soil moisture (units: g)
#' @param tin_weight the tin weight for soil moisture (units: g)
#' @param sample_wet_weight the weight of the field moist soil sample and the bag if applicable (units: g)
#' @param bag_weight the weight of the bag containing the total soil sample (units: g)

#' @return grav_moisture the gravimetric moisture content of the soil (units: g water g^-1 soil)
#' @return soil_dry_weight the soil sample weight as an oven-dry weight equivalent (units: g)
#'
#' @export
#'

dry_weight <- function(dataset, tin_soil_wet_weight, tin_soil_dry_weight,
                       tin_weight, sample_wet_weight, bag_weight) {
  enquo(tin_soil_wet_weight) # enquo() refers to specific column in dataframe
  enquo(tin_soil_dry_weight)
  enquo(tin_weight)
  enquo(sample_wet_weight)
  enquo(bag_weight)

  # for the given data set add columns for gravimetric moisture content
  # and soil sample weight (oven-dry weight equivelent)

  dataset %>%

    mutate(grav_moisture =
             ((tin_soil_wet_weight - tin_weight) -
                (tin_soil_dry_weight - tin_weight)) /
                (tin_soil_dry_weight - tin_weight)) %>%

    mutate(soil_dry_weight =
             (sample_wet_weight - bag_weight) / (1 + grav_moisture))
}
