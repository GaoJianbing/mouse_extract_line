function [line_x, line_y] = mouse_extract_line(file, nm)
    %% 作者：Mr.Bing
    %% 邮箱：bing_feilong@126.com
    %% 欢迎大家交流！！
    
    % 加载图像并灰度化
    pic = double(imread(file));
    pic_line = (pic(:,:,1)+pic(:,:,2)+pic(:,:,3))/3;
    pic_line = 1 - pic_line/max(max(pic_line));
    [h,w] = size(pic_line);
    
    % 画图并捕捉鼠标
    figure(1)
    imshow(pic_line); hold on;
    coordinates_input = ginput(1);
    x0 = round(coordinates_input(1));
    y0 = round(coordinates_input(2));
    
    % 提取曲线中心坐标位置
    r = 15;
    thr = 0.2;
    line_x = 1:w;
    line_y = line_x*0;
    for x = x0:w
        sub_y = max([y0-r,1]):min([y0+r,h]);
        sub_pic = pic_line(sub_y,x);
        if sum(sub_pic) == 0
            break;
        end
        k = sub_pic > thr;
        y = round(mean(sub_y(k)));
        y0 = min(sub_y(k));
        if pic_line(y0+1,x) <= thr
            y0 = y;
        end
        line_y(x) = y;
        if mod(x,5)==0
            plot(x,y,'s','LineWidth',2,...
                        'MarkerEdgeColor','k',...
                        'MarkerFaceColor','g',...
                        'MarkerSize',5); hold on;
            pause(0.02);
        end
    end
    hold off; title(nm);
    
    mk = line_y > 0;
    line_x = line_x(mk);
    line_y = line_y(mk);
    line_y = max(line_y)-line_y;
end
