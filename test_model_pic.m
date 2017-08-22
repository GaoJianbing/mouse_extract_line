clear; clc; clf;
pic_dir = 'D:/test_data/pulse_data/model_pic/';
files = dir(fullfile(pic_dir,'*.jpg'));
for n = 1:length(files)
    nm = files(n).name;
    file = strcat(pic_dir, nm);
    [line_x, line_y] = mouse_extract_line(file, nm);
    figure(2)
    plot(line_x, line_y, 'r-o'); grid on;
    break;
end