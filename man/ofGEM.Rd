% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ofGEM.r
\name{ofGEM}
\alias{ofGEM}
\title{A meta-analysis approach with filtering for identifying gene-level
gene-environment interactions with genetic association data}
\usage{
ofGEM(Z, X, R, weight, threshold = 0.1, maxSim = 1e+06, tol = 10)
}
\arguments{
\item{Z}{a matrix of test statistics for gene-environment interactions (GxE)
from consortium data. Each row corresponds to a SNP in a set (e.g., a gene),
and each column represents a study. For multi-ethnic groups, Z is a list
with each element being the matrix for each ethnic group.}

\item{X}{a matrix of filtering statistics for GxE. Each row corresponds to a
SNP in a set, and each column represents a study. For multi-ethnic groups, X
is a list with each element being the matrix for each ethnic group.}

\item{R}{the correlation matrix of test statistics for SNPs in a set. One
may use the genotype LD matrix for the set of SNPs to approximate it. This
matrix is used when sampling correlated testing and filtering statistics
under the null hypothesis and to obtain the null meta-analysis statistics.
For multi-ethnic groups, R is a list with each element being the correlation
matrix for each ethnic group.}

\item{weight}{the weight vector for each study, or the weight matrix for
each SNP and each study. If the weight is the same across SNPs, it is a
vector with length equaling to the number of studies. If the weight is
different for different SNPs, it is a matrix with each row corresponding to
each SNP and each column representing each study.}

\item{threshold}{a fixed p-value threshold for filtering test. The default
is 0.1.}

\item{maxSim}{the maximum number of samplings performed in obtaining the
sets of correlated testing and filtering statistics under the null. The
default is 1e6. This number determines the precision of the p-value
calculation.}

\item{tol}{the tolerance number to stop the sequential sampling procedure.
The default is 10. We count the number of sampling-based null
meta-statistics that is more extreme than the observed meta-statistics. We
sequentially increase the number of sampling with an increment of 100. The
sequential sampling will stop if the cumulative count reaches tol. The idea
is to stop pursuing a higher precision with more sampling of null if the
p-value appears to be not significant. If tol = 0, the number of samplings
equals to maxSim.}
}
\value{
A list containing \item{pval_random_mf}{the p-value based on the
random-effects meta-analysis test with its corresponding meta-filtering.}
\item{pval_fixed_mf}{the p-value based on the fixed-effects meta-analysis
test with its corresponding meta-filtering.} \item{pval_ofGEM}{the p-value
based on using Fisher's method to aggregating the p-values of fixed- and
random-effects meta-analysis tests with meta-filtering} \item{nsim}{the
number of samplings being performed.}
}
\description{
This function first conducts a meta-filtering test to filter out unpromising
SNPs. It then runs a test of omnibus-filtering-based GxE meta-analysis
(ofGEM) that combines the strengths of the fixed- and random-effects
meta-analysis with meta-filtering. It can also analyze data from multiple
ethnic groups. The p-values are calculated using a sequential sampling
approach.
}
\examples{


data(sim_dat)

pval = ofGEM(Z = sim_dat$Z, X = sim_dat$X, R = sim_dat$R, weight = rep(1/6, 6))


}
\references{
Wang, Liu, Pierce, Huo, Olopade, Ahsan, & Chen (2017+). A
meta-analysis approach with filtering for identifying gene-level
gene-environment interactions with genetic association data. Submitted.
}
