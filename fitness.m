function elite = fitness(pop,d,n,m)
table = zeros(m,1);
for j=1:m
    t = n;
    s = pop(j,1);
    distance = d(t,s);
    for i = 1:n-2
        t = s;
        s = pop(j,i+1);
        distance = distance + d(t,s);
    end;
    t = s;
    s = n;
    distance = distance + d(t,s);
    table(j) = distance;
end;

[fitvalue,I]= sort(table);
table = [fitvalue I];
display('Best fit value and its index in the poplulation');
disp(table(1,:));
elite = pop(I(1:(m/10)),:);
end
