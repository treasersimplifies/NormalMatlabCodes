function [y_start,z_start,x_reality,n_reality] = Aitken(f_name,x_start,tolerance,n_limit)
%%
%���ؿϼ��ٷ���ⷽ��f_name = 0����MATLABʵ��
% f_nameΪ��������
% x_startΪ��ʼ�����ĳ�ʼ����
% toleranceΪ���������ľ���Ҫ��
% n_limitΪ����������������
%%
% y_startΪ���ؿϼ��ٷ�ѭ���е�һ�εĵ�������ֵ
% z_startΪ���ؿϼ��ٷ�ѭ���еڶ��εĵ�������ֵ
% x_realityΪ���յ������
% n_realityΪ���ĵ�������
%%
format long; % ������������С�����14λ
%fprintf('���ؿϼ��ٷ��󷽳�: %s = 0 �Ľ��Ƹ�\n',f_name);
n_reality = 0;
x_reality = x_start;
%%
while 1
    n_reality = n_reality + 1;
    y_start = feval(f_name,x_reality); % ����
    z_start = feval(f_name,y_start); % ����
    x_start = x_reality;
    % ����
    x_reality = x_reality - (y_start - x_reality).^2 / (z_start - 2 * y_start + x_reality);
    %fprintf('n_reality=%d, x_start=%14.14f,y_start=%14.14f, z_start=%14.14f\n',n_reality,x_start,y_start,z_start);
        if(abs(x_reality - x_start) <= tolerance) % ������㾫��Ҫ��������������whileѭ��
            %fprintf('�ھ��Ȳ�����%.14f��������,����:%s = 0 �ĸ�Ϊ %.14f\n��������Ϊ:%d\n',...
            %tolerance,f_name,x_reality,n_reality);
            break;
        elseif(n_reality > n_limit) % ������������������ƣ������ʾ�����ѭ��
            disp('������������');
            break;
        end
end
disp('���ؿϼ��ٷ�����');
end
%%
% ���ؿϼ��ٷ����ŵ㣺
% 1.�����ٶȿ�
% 2.û���漰�����ļ���
%%