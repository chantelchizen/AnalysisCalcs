% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/moisture_calculation.R
\name{dry_weight}
\alias{dry_weight}
\title{Calculate soil moisture and total soil dry weight}
\usage{
dry_weight(
  dataset,
  tin_soil_wet_weight,
  tin_soil_dry_weight,
  tin_weight,
  sample_wet_weight,
  bag_weight
)
}
\arguments{
\item{dataset}{the dataset containing the parameters}

\item{tin_soil_wet_weight}{the weight of the field moist soil and tin for soil moisture (units: g)}

\item{tin_soil_dry_weight}{the weight of the oven dry soil and tin for soil moisture (units: g)}

\item{tin_weight}{the tin weight for soil moisture (units: g)}

\item{sample_wet_weight}{the weight of the field moist soil sample and the bag if applicable (units: g)}

\item{bag_weight}{the weight of the bag containing the total soil sample (units: g)}
}
\value{
grav_moisture the gravimetric moisture content of the soil (units: g water g^-1 soil)

soil_dry_weight the soil sample weight as an oven-dry weight equivalent (units: g)
}
\description{
Calculate soil moisture and total soil dry weight
}
