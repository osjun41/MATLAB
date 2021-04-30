load count.dat;
c3 = count(:,3);

h = histogram(c3, 10);   %히스토그램을 그리는 데 bin간격을 10으로 설정한다.
N = max(h.Values);       %히스토그램에서 최댓값을 구한다.
mu3 = mean(c3);          %데이터의 평균을 구한다.
sigma3 = std(c3);        %데이터의 표준편차를 구한다.

hold on
plot([mu3 mu3],[0 N],'r','LineWidth',2) %평균값에 해당하는 mu3에서 0부터 N까지를 잇는 선폭 2짜리 빨간 선을 그려라.
X = repmat(mu3+(1:2)*sigma3,2,1);       %mu3+(1:2)*sigma3 의 값을 2행 1열짜리 행렬로 만든다.
Y = repmat([0;N],1,2);                  %

plot(X,Y, 'Color',[255 153 51]./255,'Linewidth',2)
legend('Data', 'Mean', 'Stds')
hold off

outliers = (c3- mu3) > 2*sigma3;        %편차가 표준편차의 2배를 넘어서는 놈들이 있으면 bool값으로 반환해라. outliers가 논리연산자가 된것임.
c3m = c3;
c3m(outliers) = NaN;                    %이상값인 257(c3m(outliers))을 NaN값으로 전환해줌.

plot(c3m,'--')
