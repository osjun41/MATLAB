Data_sw14 = xlsread('test_sw14.csv');
x = Data_sw14(:,1);
y = Data_sw14(:,2);
plot(x,y)
threshold = input("Enter the threshold value:");

Y = findpeaks(y);
for i = 1:length(Y)
    if Y(i) > threshold
        count = count + 1;
    end
end
disp(count);