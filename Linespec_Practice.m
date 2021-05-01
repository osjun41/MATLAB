x = 0:0.01:10;
y = cos(x) - exp(-x);

plot(x, y)                 % 오리지널
plot(x, y, 'd')            % 선스타일은 지정하지 않으면 'd'(다이아몬드) 마커만 표기 되어 출력됨.
plot(x, y, '- r *')        % -  실선, r 빨간색, * 별모양마커 
plot(x, y, '-- m o')       % -- 파선, m 자홍색, o 0형마커
plot(x, y, ': b s')        % :  점선, b 파란색, s 사각형 마커
%여기까지지가 선 스타일, 색, 마커기호 설정 부분.

plot(x, y, ': b s', 'linewidth',2)  %선 두께 2로 늘리기
plot(x, y,  '- r s', 'markeredgecolor', 'k')  %마커 테두리 검정색 변경
plot(x, y,  '- r s', 'linewidth',2, 'markeredgecolor', 'k', 'markerfacecolor', 'g')


axis([0 10 -2 2])