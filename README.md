# multiple-regression
Multiple regression is an extension of simple linear regression. 
It is used when we want to predict the value of a variable based on the value of two or more other variables. 
The variable we want to predict is called the dependent variable (or sometimes, the outcome, target or criterion variable).
One of these two matlab code files is to create a multiple regression function, and the other one is to show an example to use this function with independent variable x.mat (100 features and 400 samples) and dependent variable y.mat. 
In this case, I generate a function called "multireg.m", whcih will give me testing and traing error as well as the predicted model. What I need input is the testing and traing dataset, and the selection of λ. The model prediction is based on the following function.
θ∗ =(XTX+λI)−1XTy
Then, the training error and testing error can be calculated with the l2 norm function. errtrain = 1 􏰃(Y train − Xtrainθ)2 + λ 􏰃θ2
2N 2N errtest = 1 􏰃(Y test − Xtestθ)2 + λ 􏰃θ2
2N 2N
To find reasonable λ, I try 1000 times and let λ ranged from 0 to 1000. As λ ranges from 0 to
500, the training error increases, but testing error decreases. As λ ranges from 500 to 1000, both training error and tesing error do not have an obvious change. Moreover, training error is always smaller than testing error, because the predicated model is based on training data.
When λ is around 500, the testing error almost reaches the minimum point.
