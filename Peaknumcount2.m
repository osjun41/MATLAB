clc;
clear;
count = 0;
Data = xlsread('test.csv');         % 행은 20002개, 열은 26개.
C = cell(1, size(Data,2));          % 데이터 열을 대입할 컨테이너를 만든다. (20002*1행렬 사이즈)
for k = 1:size(Data,2)            % 데이터의 열의 개수 만큼 반복한다. (총 26개이므로 26번 반복)
    C{k} = Data(:,k);               % Data의 k번째 열의 데이터를 C{k}에 넣는다. 이제 x축 데이터는 C{1}에, sweep1 데이터는 C{2}에 들어가있다.
end
    
while(1)
    threshold = input("Enter the threshold value:");
    %%각 스윕 데이터 별로 픽의 갯수를 솔팅하는 함수.
    if threshold == 1
        break;
    end
    
    X = input("보고 싶은 스윕의 번호를 입력하세요.:");
    D = findpeaks(C{X+1});                % 1st sweep 데이터의 픽의 값들을 D변수에 담는다. 3439개~
    for i = 1:length(D)                     % 담겨진 데이터 픽값들의 개수만큼 루프를 돌린다.
        if D(i) > threshold                 %그 픽값이 threshold를 넘는지 확인하고
            count = count + 1;              %넘으면 count를 1올린다.
        end
    end
    disp(count);                            % 몇개의 peak이 threshold를 넘어섰는지 출력한다.
end