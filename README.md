# HLIBCov


Parallel HLIBCov code for computing maximum likelihood estimates (MLE).
The theory of this work is described here
1. Alexander Litvinenko, Ying Sun, Marc G. Genton, and David E. Keyes.  Likelihood approximation with hierarchical matrices for large spatial datasets, Computational Statistics & Data Analysis,137:pp. 115-132, 2019
2. A. Litvinenko, R. Kriemann, M.G. Genton, Y. Sun, D.E. Keyes; HLIBCov: Parallel hierarchical matrix approximation of large covariance matrices and likelihoods with applications in parameter identification  MethodsX 7, 100600, 2020 (https://arxiv.org/abs/1709.08625)




With this code you can:
1) Approximate various Matern covariance matrices in the H-matrix format,
2) Compute the Cholesky or LU decomposition in the H-matriox format
3) Compute the Gaussian joint likelihood function in the H-matrix format
4) Find maximum of the likelihood, i.e. compute the maximum likelihood estimates.
5) Compute the determinant det(C) and the inverse of a large covariance matrix, inv(C).
6) Solve a linear system Ax=b
7) Perform matrix vector product, Ax_k
8) Compute a quadratic form Z^T*inv(C)*Z



This code was written by Alexander Litvinenko (KAUST) with help of Ronald Kriemann (MPI fuer angewandte Mathematik in Leipzig).




What is needed?
First, you need to install HLIBPro (see ww.hlibpro.com).
Second, you need an optimization algorithm, which is able to find the maximum of the log-likelihood. We used one from GSL library. You can use any other, but then you may need to modify 5-7 lines of the interface.
If you would like to use the GSL library, install it.

How to install HLIBCov?
1. Copy files likelihood.cc , loglikelimax_loop.cc etc into the directory /hlibpro-2.6.1/examples/
2. Modify SConscript file 
3. type "scons" in /hlibpro-2.6.1/
4. run likelihood.exe in /hlibpro-2.6.1/examples/

How to run?
For instance
./loglikelimax_loop K16_1e-8_1.txt --verbosity=2 --threads 40 --eps 0.000001 --epslu 0.000001   --shift 0.001


Which examples are included?
1. To solve 1D MLE problem. For instance, to find only one parameter either covariance length \ell or smoothness \nu or the variance \sigma^2.
2. To solve 3D MLE problem. For instance, to find only three parameters simultaneously (\ell, \nu, \sigma^2).
3. To solve a series of problems to see how the MLE depends on the number of available measurements.
4. To solve a series of problems to see how the MLE depends on the H-matrix accuracy (used in the adaptive rank arithmetics).

Where are the data?
See please files data.tar.gz. It contains 10 measurements of size 2000; 10 replicates of size 4000; ..., 10 replicates of size 128000;
See also moisture_data.zip.
It contains the moisture data sets.



How to generate the data?
See please files 
loglikelihood_generate_synthetic_data.cc
loglikelihood_generate_data.cc
This file reads some mesh and generate random values at these points.




I do not understand what all these functioins mean!
Yes, it is not so easy. See please loglikelihood_with_details.cc
I included a lot of comments.



Can I compute values of the log-likelihood for various cov. lengths \ell=0.1:0.1:1?
Yes, see please loglikelihood_visual_dependence_on_l.cc


How to build plots?
After your c++ code finished, run appropriate scripts from /matlab_func/
I use safe_figure function from the sglib library, which you can get here
https://github.com/ezander/sglib.git (it is needed only for one single function, namelly, safe_figure)


This code is being provided to you "as is".
No warranties or guarantees of any kind. 
In case you faced a problem, write me an email or open an issue on github.
I will try to help.
Thank you,
Alexander Litvinenko,
KAUST
2018
