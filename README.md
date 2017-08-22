# mouse_extract_line
    extract_line_in_pic_use_mouse
    工作需要提取图片上的曲线，为此写了个MATLAB程序。
    
    程序一共包含两个文件：
    test_model_pic.m(主函数)
    mouse_extract_line.m(曲线提取函数)
    
    使用方法：
    用鼠标给定曲线的初始化位置。
    之后程序便会自动化提取曲线。
    
    原理说明：
    图像记作：pic_bio，当前鼠标位置记作：(x0,y0)
    从x0开始沿x轴方向横向迭代，纵向搜索。
    令搜索半径为r, 纵向范围为：sub_y = (y0-r):(y0+r);
    则搜索的范围为：s=pic_bio(x0, sub_y)
    迭代法则如下：
    x=x0;
    y=mean(sub_y), which s>0;
    x0=x0+1;
    y0=y;
    
    程序中为了寻找图像的上侧曲线，改为了y=min(sub_y)
    
    注意事项：
    本程序主要适用于白色背景+黑色曲线提取。
    其他纯色背景+纯色曲线的图像，经过简单修改后，也可以提取曲线。
    
    
    作者邮箱：bing_feilong@126.com
    欢迎大家交流！！
    
    
