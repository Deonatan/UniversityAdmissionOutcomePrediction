data = load('ScoreData1.txt'); 
X = data(:, [1,2]) ; y = data(:, 3); 

%Visualize Initial Data
fprintf('Plot current data: \n')
plotData(X, y) ; 

fprintf('Press enter to view Decision Boundary \n')
pause 

[m, n] = size(X) ; 
X = [ones(m,1) , X]; 

%Inital Parameter
initial_theta = zeros(n + 1, 1) ; 

%Cost Function and Gradient Descent 
[cost , grad] = costFunction(initial_theta , X, y);

%Optimization using fminunc 
options = optimset( 'Gradobj' , 'on' , 'MaxIter', 400); 
[theta , cost] = fminunc(@(t) (costFunction(t , X, y )) , initial_theta , options);

%Decision Boundary 
fprintf('Plotting Decision Boundary \n')  
plotDecisionBoundary(theta, X, y) ; 

%Compute accuracy on training set 
p = predict(theta, X); 
fprintf( 'Train Accuracy : %f\n' , mean(double(p==y))*100);

%Input probability 
score1 = input("Enter first score: ")
score2 = input("\nEnter second score: ")    
prob = sigmoid([1 score1 score2]*theta); 
fprintf(['For a student with scores %f and %f, we predict an admission ' ...
         'probability of %f\n'], score1 , score2,prob)