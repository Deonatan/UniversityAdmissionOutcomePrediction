function plotData(X, y)
  figure; hold on;
  pos = find(y==1); neg = find(y==0); 
  plot(X(pos,1) , X(pos,2), 'k+' , 'LineWidth' , 2 , 'MarkerSize' , 7); 
  plot(X(neg,1) , X(neg,2) , 'ko' , 'MarkerFaceColor' , 'b' , 'MarkerSize', 7);
  
  xlabel('Exam 1 score')
  ylabel('Exam 2 score') 
  legend('Admitted' , 'Not admitted')
  hold off; 
  end 