function [bestEpsilon bestF1] = selectThreshold(yval, pval)
% bestEpsilon: the best epsilon of the model.
% bestF1: The F1 score of the best epsilon.
% yval: Values of the cross validation set.
% pval: Probabilities of the cross validation set.



bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;

for epsilon = min(pval):stepsize:max(pval)

predictions = (pval < epsilon);
tp = sum((predictions==1)&(yval==1));
fp = sum((predictions==1)&(yval==0));
fn = sum((predictions==0)&(yval==1));
a=tp+fp;
b=tp+fn;

if (a!=0)
if (b!=0)

prec=tp/a;
rec=tp/b;
F1=2*(prec*rec)/(prec+rec);
    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    endif

endif
endif

endfor


end









