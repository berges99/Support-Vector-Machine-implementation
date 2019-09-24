# Parameters
param n >= 1, integer; #features
param m >= 1, integer; #number of observations
param nu;              #tradeoff parameter

param y {1..m};        #response value
param A {1..m,1..n};   #feature values

# Variables
var w {1..n};
var gamma;             #intercept
var s {1..m};          #slacks


# Primal problem of the SVM
minimize primal_SVM:
	0.5*sum{j in {1..n}}(w[j]^2) +nu*sum{i in {1..m}}(s[i]);
	
subject to c1 {i in {1..m}}:
	-y[i]*(sum{j in {1..n}}(A[i,j]*w[j]) +gamma) -s[i] +1 <= 0;
subject to c2 {i in {1..m}}:
	-s[i] <= 0;
	