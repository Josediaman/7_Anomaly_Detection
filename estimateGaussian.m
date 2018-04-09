function [mu sigma2] = estimateGaussian(X)
% mu: Median values.
% sigma2: Standart derivations values.
% X: Train examples.


[m, n] = size(X);
mu = zeros(n, 1);
sigma2 = zeros(n, 1);
mu = (1/m)*sum(X);
XX=X'-mu';
sigma2 = (1/m)*sum(XX'.^2);

end
