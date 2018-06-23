function k = chi(u,v,x,y)

if all(size(u) == 1),u = u(ones(size(v)));end

if all(size(v) == 1),v = v(ones(size(u)));end

k = inpolygon(u,v,x,y);