function [abf_raw, contents] = abfload_JM()

contents = string(UI_pick_files_dirs('FilterSpec', 'C:\Users\KBRI\Desktop\BNJoo file\Prev_Work\*.abf'));

for n=1:length(contents)
    a = abfload(contents(n));
    abf_raw(:,n,:) = a(:,1,:);
    
end
    
end

