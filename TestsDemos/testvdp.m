function dy = testvdp(t,y)
dy = zeros(2,1);%明确维数，2阶都这样求
dy(1) = y(2);
dy(2) = 1000*(1-y(1)^2)*y(2) - y(1);
