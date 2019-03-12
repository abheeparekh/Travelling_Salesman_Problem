function children = crossover(elite,n,m)
children = zeros((8*m/10),n-1);
for x = 1:(8*m/10)
    p1 = randi(m/10);
    p2 = randi(m/10);
    if(p1==p2)
        children(x,:) = elite(p1,:);
    else
        i = randi(n-1);
        j = randi(n-1);
        if(i<=j)
            children(x,i:j) = elite(p1,i:j);
            l=1;
            for k=1:n-1
                while(l>=i && l<=j)
                    l = l+1;
                end;
                skip=0;
                for h=i:j
                    if(elite(p2,k)==children(x,h))
                        skip=1;
                        break;
                    end;
                end;
                if(~skip)
                    children(x,l) = elite(p2,k);
                    l = l+1;
                end;
            end;
        else
            children(x,j:i) = elite(p1,j:i);
            l=1;
            for k=1:n-1
                while(l>=j && l<=i)
                    l = l+1;
                end;
                skip=0;
                for h=j:i
                    if(elite(p2,k)==children(x,h))
                        skip=1;
                        break;
                    end;
                end;
                if(~skip)
                    children(x,l) = elite(p2,k);
                    l = l+1;
                end;
            end;
        end;
    end;
end;