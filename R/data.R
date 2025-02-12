#' Description of experimental units
#'
#' A dataset containing links between experimental and 
#' observational units in the SEXY trials. The plots are
#' double wide tractor widths, meaning two passes of the same
#' treatment are next to each other. This was done to create one 
#' side for yield measurements, and the other for destructive sampling.
#' It may seem like overkill, but it is designed to make merging
#' with all kinds of data easier. The variables are as follows:
#'
#' @format A data frame with 96 rows and 10 variables:
#' \describe{
#'   \item{trial_id}{Identifies which trial, Trial1 was established fall 2024}
#'   \item{eu_id}{Identifies the unique treatment instance, but north or south half of the plot}
#'   \item{eu2_id}{Identifies a unique treatment instance}
#'   \item{block_id}{Identifies the block (1-4)}
#'   \item{plot_id}{Identifies the plot (101-112, 202-212, 301-312, 401-412)}
#'   \item{plothalf_id}{Indicates the half of the plot, used if samples are taken from both halves or only one half}
#'   \item{plot_idtim}{A much simpler way to designate the plot halves used by Tim (a or b)}
#'   \item{trt_id}{A unique identifier for the treatments 
#'   (p, xp, pcc, xpcc, a, xa, acc, xacc, aprow, xaprow, apmix, xapmix)}
#'   \item{weedctl_id}{A unique identifier for weed control treatments (none, herbicides = herb)}
#'   \item{cctrt_id}{A unique identifier for cover crop treatments 
#'   (none = nocc, fall cover crop = fcc)}
#'   \item{crop_cat}{A simple idenifier for annual (ann), perennial (perenn), or mixed (mix) systems}
#' }
"sexy1_eukey"

#' Drone data from Tim, vegetation coverage
#'
#' A dataset containing the data provided by Tim and his drone
#'  regarding vegetation coverage. The variables are as follows:
#'
#' @format A data frame with an expanding number of rows and 8 variables:
#' \describe{
#'   \item{date}{the ymd the data was collected}
#'   \item{plot_idtim}{the obs unit in Tim's notation, linked to sexy1_eu}
#'   \item{mean}{I don't know the units on these...}
#' }
"sexy1_coverage"

#' Manually collected standcount data
#'
#' A dataset containing the data collected by Anders and Gina
#'  estimating stand counts. The variables are as follows:
#'
#' @format A data frame with an expanding number of rows and 4 variables:
#' \describe{
#'   \item{trial_id}{Identifies which trial, Trial1 was established fall 2024}
#'   \item{date}{the ymd the data was collected}
#'   \item{eu2_id}{the obs unit the data was collected on}
#'   \item{plants_m2}{The number of plants present per square meter}
#' }
"sexy1_standcounts"