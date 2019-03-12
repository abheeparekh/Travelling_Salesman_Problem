function z = mutate(x,n)
z = zeros(10,n-1);
for a=1:10
    b=randi(40);
    z(a,:) = x(b,:);
    i = randi(n-1);
    j = randi(n-1);
    if(i~=j)
        z(a,i) = x(b,j);
        z(a,j) = x(b,i);
    end;
end;