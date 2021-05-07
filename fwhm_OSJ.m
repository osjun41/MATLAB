function width = fwhm_OSJ(x,y)

% function width = fwhm(x,y)
%
% Full-Width at Half-Maximum (FWHM) of the waveform y(x)
% and its polarity.
% The FWHM result in 'width' will be in units of 'x'
%
%
% Rev 1.2, April 2006 (Patrick Egan)
Data = xlsread('fwhm_practice.csv');         % 행은 1000개, 열은 2개.
C = cell(1, size(Data,2));          % 데이터 열을 대입할 컨테이너를 만든다. (1*2 짜리 행렬 칸 생성)
for k = 1:size(Data,2)              % 데이터의 열의 개수 만큼 반복한다. (총 2개이므로 2번 반복)
    C{k} = Data(:,k);               % Data의 k번째 열의 데이터를 C{k}에 넣는다. 이제 x축 데이터는 C{1}에, sweep1 데이터는 C{2}에 들어가있다.
end
x = C{1};
y = C{2};

y = y / max(y);
N = length(y);
lev50 = 0.5;
if y(1) < lev50                  % find index of center (max or min) of pulse
    [garbage,centerindex]=max(y);
    Pol = +1;
    disp('Pulse Polarity = Positive')
else
    [garbage,centerindex]=min(y);
    Pol = -1;
    disp('Pulse Polarity = Negative')
end
i = 2;
while sign(y(i)-lev50) == sign(y(i-1)-lev50)
    i = i+1;
end                                   %first crossing is between v(i-1) & v(i)
interp = (lev50-y(i-1)) / (y(i)-y(i-1));
tlead = x(i-1) + interp*(x(i)-x(i-1));
i = centerindex+1;                    %start search for next crossing at center
while ((sign(y(i)-lev50) == sign(y(i-1)-lev50)) & (i <= N-1))
    i = i+1;
end
if i ~= N
    Ptype = 1;  
    disp('Pulse is Impulse or Rectangular with 2 edges')
    interp = (lev50-y(i-1)) / (y(i)-y(i-1));
    ttrail = x(i-1) + interp*(x(i)-x(i-1));
    width = ttrail - tlead;
else
    Ptype = 2; 
    disp('Step-Like Pulse, no second edge')
    ttrail = NaN;
    width = NaN;
end
