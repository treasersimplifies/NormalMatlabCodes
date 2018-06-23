function [y_start,z_start,x_reality,n_reality] = Aitken(f_name,x_start,tolerance,n_limit)
%%
%艾特肯加速法求解方程f_name = 0根的MATLAB实现
% f_name为迭代函数
% x_start为开始迭代的初始坐标
% tolerance为函数迭代的精度要求
% n_limit为函数的最大迭代次数
%%
% y_start为艾特肯加速法循环中第一次的迭代函数值
% z_start为艾特肯加速法循环中第二次的迭代函数值
% x_reality为最终迭代结果
% n_reality为最后的迭代次数
%%
format long; % 计算结果保留到小数点后14位
%fprintf('艾特肯加速法求方程: %s = 0 的近似根\n',f_name);
n_reality = 0;
x_reality = x_start;
%%
while 1
    n_reality = n_reality + 1;
    y_start = feval(f_name,x_reality); % 迭代
    z_start = feval(f_name,y_start); % 迭代
    x_start = x_reality;
    % 加速
    x_reality = x_reality - (y_start - x_reality).^2 / (z_start - 2 * y_start + x_reality);
    %fprintf('n_reality=%d, x_start=%14.14f,y_start=%14.14f, z_start=%14.14f\n',n_reality,x_start,y_start,z_start);
        if(abs(x_reality - x_start) <= tolerance) % 如果满足精度要求，输出结果，跳出while循环
            %fprintf('在精度不超过%.14f的条件下,方程:%s = 0 的根为 %.14f\n迭代次数为:%d\n',...
            %tolerance,f_name,x_reality,n_reality);
            break;
        elseif(n_reality > n_limit) % 如果迭代次数超过限制，输出提示语，结束循环
            disp('迭代次数超界');
            break;
        end
end
disp('艾特肯加速法结束');
end
%%
% 艾特肯加速法的优点：
% 1.收敛速度快
% 2.没有涉及导数的计算
%%