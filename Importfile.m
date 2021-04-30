Data_sw14 = xlsread('test_sw14.csv');
opts = detectImportOptions('test_sw14.csv')
opts.SelectedVariableNames = {'Time_s_', 'Sweep_1'}
preview('test_sw14.csv',opts) 

xlswrite('test_sw14_exported',Data_sw14);