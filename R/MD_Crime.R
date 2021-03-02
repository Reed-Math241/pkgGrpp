#' Maryland Crimes(2020)
#'
#' A subdataset of “Crime” dataset reported by National Incident-Based Reporting System (NIBRS) of the Criminal Justice Information Services (CJIS) Division Uniform Crime Reporting (UCR) Program and documented by approved police incident reports. The current dataset contains all the reported crimes in Maryland in 2020.
#'
#' @format A data frame with 30587 rows and 17 variables:
#' \describe{
#'   \item{Incident ID}{ID}
#'   \item{Crime Name1}{A factor denoting the general category of a crime(Crime Against Person, Crime Against Property, Crime Against Society)}
#'   \item{Crime Name2}{A facotr denoting subcategory of a crime}
#'   \item{Crime Name3}{A factor denoting spefic crime name}
#'   \item{Crime Name4}{A factor denoting remaining important detail of a crime}
#'   \item{Victims}{An integer denoting the number of vicims involved in a crime}
#'   \item{City}{A factor denoting the city in which a crime is commited}
#'   \item{Place1}{A factor denoting the place where a crime is commited}
#'   \item{Place2}{A factor denoting the subcategory of where a crime is commited}
#'   \item{Dispatch Date}{Date of police dispatch for a crime}
#'   \item{Dispatch Time}{Time of police dispatcch for a crime}
#'   \item{Start Date}{Reported starting date of a crime}
#'   \item{Start Time}{Reported starting time of a crime}
#'   \item{End Date}{Reported ending date of a crime}
#'   \item{End Time}{Reported ending time of a crime}
#'   \item{Longitude}{Longitude of where a crime is taken place}
#'   \item{Latitude}{Latitude of where a crime is taken place}
#' }
#' @source \url{https://catalog.data.gov/dataset/crime}
"MDCrime2020"