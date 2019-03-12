function y=popgen(n,m)
r1 = zeros(m,n-1);
for i=1:m
   q=randperm(n-1);
   r1(i,:)=q;
end;
y=r1;
end