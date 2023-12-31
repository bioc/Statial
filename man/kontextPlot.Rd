% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rsCurve.R
\name{kontextPlot}
\alias{kontextPlot}
\title{Plotting the original and kontextual L values over a range of radii.}
\usage{
kontextPlot(rsDf)
}
\arguments{
\item{rsDf}{A data frame from \code{\link[Statial]{kontextCurve}}.}
}
\value{
A ggplotly object showing the original and kontextual L function
 values over a range of radii
}
\description{
This function takes outputs from rsCurve and plots
them in ggplot. If standard deviation is estimated in rsCurve,
then confidence intervals will be constructed based on the standard deviation.
If the confidence interval overlaps with 0, then the relationship is insignificant 
for that radius.
}
\examples{
data("kerenSCE")

kerenImage6 = kerenSCE[, kerenSCE$imageID =="6"]

rsDf <- kontextCurve(
  cells = kerenImage6,
  from = "p53",
  to = "Immune",
  parent = c("p53", "Keratin+Tumour"),
  rs = seq(10, 510, 100),
  cores = 2
)

kontextPlot(rsDf)

}
