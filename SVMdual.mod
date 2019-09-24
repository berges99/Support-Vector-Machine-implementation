# Parameters
param n >= 1, integer; #features
param m >= 1, integer; #observations
param nu;              #tradeoff parameter

param y {1..m};        #response value
param A {1..m,1..n};   #feature values

# Variables
var lambda {1..m} >= 0, <= nu;

# Dual problem of the SVM
maximize dual_SVM:
	sum{i in {1..m}}lambda[i] 
	-0.5*sum{i in {1..m}, j in {1..m}}lambda[i]*y[i]*lambda[j]*y[j]*(sum{k in {1..n}}A[i,k]*A[j,k]);
	
subject to c1:
	sum{i in {1..m}}(lambda[i]*y[i]) = 0;