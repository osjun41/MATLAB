clc;
clear;
Data = xlsread('test.csv');         % 행은 20002개, 열은 26개.
C = cell(1, size(Data,2));          % 데이터 열을 대입할 컨테이너를 만든다. (1*26 짜리 행렬 칸 생성)
for k = 1:size(Data,2)              % 데이터의 열의 개수 만큼 반복한다. (총 26개이므로 26번 반복)
    C{k} = Data(:,k);               % Data의 k번째 열의 데이터를 C{k}에 넣는다. 이제 x축 데이터는 C{1}에, sweep1 데이터는 C{2}에 들어가있다.
end

threshold = 0;

X = [1: size(Data,2)-1]';           % x축(스윕번호) - 스윕 번호의 개수만큼의 사이즈로 행렬 생성. (25개)
Y= zeros(25,1);                     % y축(픽 개수)  - 픽 개수를 담을 컨테이너 생성 (25*1 짜리)  = myfun(C)


for j = 1:size(Data,2)-1
    pk = findpeaks(C{j+1});               % j번 스윕의 국소 픽값들을 찾아서 pk변수에 담는다.
    count = 0;
    for i = 1:length(pk)
        if pk(i) > threshold
            count = count+1;
            Y(j) = count/0.6;
        end
    end
    
end

plot(X,Y, 'r o', 'markerfacecolor','r');
xlabel('Sweep#')
ylabel('Firing Rate(Hz)')