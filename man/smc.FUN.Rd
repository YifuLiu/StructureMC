\name{smc.FUN}
\alias{smc.FUN}
\title{
Structured Matrix Completion
}
\description{
The main function in our package, smc.FUN, is for recovery of the missing block A22 of an approximately low-rank matrix A given the other blocks A11, A12, A21.
}
\usage{
smc.FUN(A.mat, c_T, col_thresh, m1, m2)
}

\arguments{
  \item{A.mat}{
The approximately low-rank matrix that we want to recover
}
  \item{c_T}{
c_T is the thresholding level, the default value is 2.
}
  \item{col_thresh}{
  is column thresholding
}
  \item{m1}{
number of rows of block A11
}
  \item{m2}{
number of columns of block A11
}
}

\references{
Cai, T., Cai, T. T., & Zhang, A. (2015). Structured Matrix Completion with Applications to Genomic Data Integration. \emph{Journal of the American Statistical Association}.
}
\author{
Yifu Liu and Anru Zhang 
}


\examples{
##dimension of matrix A with row number p1 = 10 and column number p2 = 9
p1 = 60
p2 = 50
m1 = 55##row number of A11
m2 = 45##column number of A11
A = matrix(rnorm(300, mean = 0.05, sd = 0.1), p1, p2)
#different blocks of our matrix A
A11 = A[1:m1, 1:m2]
A12 = A[1:m1, (1+m2):p2]
A21 = A[(1+m1):p1, 1:m2]
Arecovery = rbind(cbind(A11,A12),cbind(A21,matrix(NA,nrow=p1-m1,ncol=p2-m2)))
##recovery the block A22
A22 = smc.FUN(Arecovery, 2, "True", m1, m2) 

}

\keyword{ structure }
\keyword{ matrix }
\keyword{ completion }
\keyword{ Genomic }

