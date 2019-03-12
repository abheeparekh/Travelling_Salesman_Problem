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
% display('Fitness values');
% display(table);

%[M1,I] = min(table);
% k1=1;
% min=table(1,2);
% for i=1:n
%     
%         if(min>table(i,2))
%             min=table(i,2);
%             k1=i;
%         end
%     
% end
% k1;
% d1=table(k1,2);
% [d1,k1] = min(table, [], 1);
% display('Fittest chromosome');
% fc1 = pop(k1,:);

[fitvalue,I]= sort(table);
table = [fitvalue I];
display('Best fit value and its index in the poplulation');
disp(table(1,:));
elite = pop(I(1:(m/10)),:);
end