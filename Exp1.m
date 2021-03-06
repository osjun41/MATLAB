%p.49 연습문제
w = logspace(-2,2,5)
s=j*w;
Gs = 1./(s.^2+2*s+3);
mag = abs(Gs)
% 여기서 얻은 지식은 행렬 데이터의 요소별 곱셈이나 나눗셈을 할 경우에는 . 첨자를 계산기호에 꼭 붙여야 한다는것!

%행렬의 정보 얻기 연습문제
A = round(10*rand(5,4))
size(A)         % 행렬의 행과 열의 크기를 행벡터로 반환한다. ->  4   4
[m n] = size(A) % size함수가 위와 같이 값을 반환하므로, [m n]의 형태로 받을 수 있다. 

size(A, 1)       %행의 개수
size(A, 2)       %열의 개수
numel(A)        %원소 개수
length(A)       %행이나 열중 큰 놈의 개수