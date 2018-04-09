

%% ................................................
%% ................................................
%%  ANOMALY DETECTION
%% ................................................
%% ................................................





%% 1. Clear and Close Figures
clear ; close all; clc





%% ==================== Part 1: Data ====================
fprintf('\n \nDATA\n.... \n \n \n');   





%% 2. Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Add your own file

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fprintf('Loading data ...\n'); 
%%%%%%********Select archive********   
load('ex8data1.mat'); 
m = size(X, 1);
fprintf('(X) (10 items)\n');   
[X(1:10,1:2)]
fprintf('Program paused. Press enter to continue. \n \n \n');
pause;




%% ======== Part 2: Training Anomaly Detection =========
fprintf('TRAINING ANOMALY DETECTION\n....................\n \n \n \n');



[mu sigma2] = estimateGaussian(X);
%%%%%%*****Select method: Gaussian o multivariate gaussian****   
p = Gaussian(X, mu, sigma2);
%p = multivariateGaussian(X, mu, sigma2);
fprintf('Program paused. Press enter to continue.\n');
%%%%%%*****Select epsilon****   
epsilon=9e-004;
pause;





%% =========== Part 3: Results ===============
fprintf('\n \n \n \n RESULTS\n........\n \n \n \n');





fprintf('Anomaly values \n \n');
outliers = find(p < epsilon);
X(outliers,1:2)
fprintf('Program paused. Press enter to continue.\n');
pause;





if (size(X,2)==2)
%% ================ Part 2': GRAPHIC ================
fprintf('GRAPHIC \n...... \n \n \n \n');





visualizeFit(X,  mu, sigma2);
hold on
plot(X(outliers, 1), X(outliers, 2), 'ro', 'LineWidth', 2, 'MarkerSize', 10);
hold off
fprintf('Program paused. Press enter to continue.\n');
pause;
endif





%% ================ Part 5: Validation ================
fprintf('\n\nVALIDATION\n.......... \n \n \n \n');





%%%%%%*****Select method: Gaussian o multivariate gaussian****   
%pval = multivariateGaussian(Xval, mu, sigma2);
pval = Gaussian(Xval, mu, sigma2);
[epsilon2 F1] = selectThreshold(yval, pval);
if (F1!=0)
fprintf('\n Actual epsilon: \n');
fprintf(' %d \n', epsilon);
fprintf('\nThe best epsilon: \n');
fprintf(' %d \n', epsilon2);
endif
if (F1==0)
fprintf('\n No se puede calcular el mejor epsilon. \n\n');
endif
fprintf('Program paused. Press enter to continue.\n');
pause;





