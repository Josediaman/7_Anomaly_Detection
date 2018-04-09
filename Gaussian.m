function p = Gaussian(X, mu, Sigma2)
%    p: Computes the probability density function of the 
%    examples X under the multivariate gaussian distribution 
%    with parameters mu and Sigma2. 
%    X: Training values.
%    mu: Median values.
%    Sigma2: standart derivations.




k = length(mu);
X = bsxfun(@minus, X, mu(:)');

p = prod((1./(sqrt(2*pi)*Sigma2')).*exp(-(X'.^2)./(2*(Sigma2'.^2))));


end