# Yves Rosseel (2012). lavaan: An R Package for Structural Equation Modeling. 
# Journal of Statistical Software, 48(2), 1-36. 
# URL http://www.jstatsoft.org/v48/i02/

# or you can run this code in JASP(https://jasp-stats.org/)

# latent variables
F =~ F-Small-world-propensity+F-Assortativity+F-Modularity+F-Transitivity+F-Synchronization
M =~ M-Small-world-propensity+M-Assortativity+M-Modularity+M-Transitivity+M-Synchronization

# regressions
higher-order ~ M + F