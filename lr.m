%logistic regression
modelFun = @(b, x)1./( 1 + exp( (-1)*(b(1) + b(2)*x(:,1) + b(3)*x(:,2) ) ) );
X = [0, 1; 1, 0; 4, 5];
y = [0; 0; 1];
beta0 = [0, 0, 0];
mdl = NonLinearModel.fit(X,y,modelFun,beta0)