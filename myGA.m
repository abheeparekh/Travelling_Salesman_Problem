%% Genetic Algorithm for Travelling Salesman Problem

%% Coordinates of cities
clc;
clear;
n=30;
cities = randi(100,[n 2]);
display(cities);
d = zeros(n);
for i=2:n
    for j=1:i-1
        d(i,j) = sqrt((cities(i,1) - cities(j,1))^2 + (cities(i,2) - cities(j,2))^2);
        d(j,i) = d(i,j);
    end;
end;
display(d);

%% Initial Population Generation
fprintf('\n\nFrom Initial Population:\n\n');
m = 100*n;
pop = popgen(n,m);
% display(pop);

%% Fitness Evaluation
elite = fitness(pop,d,n,m);
fittest = elite(1,:);
display(fittest);

%% Next population starts
pop = zeros(m,n-1);
pop(1:(m/10),:) = elite;

%% Crossover Generation
crosschildren = crossover(elite,n,m);
pop((1+(m/10)):(9*m/10),:) = crosschildren;

%% Mutations
% mutchildren = mutate(pop(1:40,:),n);
% pop(41:50,:) = mutchildren;
pop((1+(9*m/10)):m,:) = popgen(n,(m/10));

%% Repeat Fitness Evaluation, Crossover and Mutations
for i=1:n-1
    fprintf('\n\nAfter Generation %d:\n\n', i);
    elite = fitness(pop,d,n,m);
    fittest = elite(1,:);
    display(fittest);
    pop = zeros(m,n-1);
    pop(1:(m/10),:) = elite;
    crosschildren = crossover(elite,n,m);
    pop((1+(m/10)):(9*m/10),:) = crosschildren;
%     mutchildren = mutate(pop(1:40,:),n);
%     pop(41:50,:) = mutchildren;
    pop((1+(9*m/10)):m,:) = popgen(n,(m/10));
end;

%% Final Fitness Evaluation
fprintf('\n\nAfter Generation %d:\n\n', n);
elite = fitness(pop,d,n,m);
fittest = elite(1,:);
display(fittest);
finalpath = [n fittest n];
plot(cities(finalpath,1), cities(finalpath,2));
home = cities(n,:);
display(home);