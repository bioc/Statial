% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Statial.R
\name{getAbundances}
\alias{getAbundances}
\title{Wrapper to calculate imhomogenous K function between a cell and surrounding
types on each image}
\usage{
getAbundances(singleCellData, Rs = c(200), whichCellTypes = NULL, nCores = 1)
}
\arguments{
\item{singleCellData}{A dataframe with a cellType column as well as x and y spatial coordinates.
The dataframe must contain a imageID column and cellID (unique cell
identifier's) column as well}

\item{Rs}{Radius to include in that calculation of pairwise abundance (K-function)
between cells (can be a numeric or vector of radii)}

\item{whichCellTypes}{Character vector specifying what cell types to include in the calculation.
If the argument is non-null, then at least two celltypes must be specified.}

\item{nCores}{Number of cores for parallel processing}
}
\description{
Calculate the imhomogenous K function (a measure of cell type abundance) for
each cell to other cell types
}
\examples{
library(dplyr)
data("headSCE")
intensitiesData <- data.frame(t(
  SummarizedExperiment::assay(headSCE, "intensities")
))
spatialData <- data.frame(SummarizedExperiment::colData(headSCE))
markersToUse <- colnames(intensitiesData)
singleCellData <- cbind(
  spatialData[rownames(intensitiesData), ], intensitiesData
)
singleCellData <- singleCellData \%>\%
  mutate(
    across(all_of(markersToUse), function(x) ifelse(is.na(x), 0, x))
  ) \%>\%
  mutate(across(where(is.factor), as.character))

singleCellDataCounts <- getAbundances(singleCellData,
  nCores = 1,
  Rs = c(200),
  whichCellTypes = c("MC2", "SC7")
)

}