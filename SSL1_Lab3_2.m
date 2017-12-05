mainTask2();

%% Problem 2a
function y = myConv(x, h)
y = zeros(1, length(x));

for n=1:length(x)
    for k=1:length(h)
        if le(n-k+1,0)
            y(n) = y(n) + 0;
        else
            y(n) = y(n) + x(k) * h(n-k+1);
        end
        
    end
end
end

%% Problem 2b
function mainTask2
close all

x = zeros(1,10);
h1 = zeros(1,10);

for i = 1:10
    if ge(i,2) && le(i,5)
        x(i) = 1;
    elseif i == 1
        h1(i) = 1;
    end
end

y1 = myConv(x, h1);

figure
subplot(2,1,1);
stem(x);
subplot(2,1,2);
stem(y1);

%% Problem 2c
h2 = zeros(1,10);

for i = 1:10
    if i == 3
        h2(i) = 1;
    end
end

y2 = myConv(x, h2);

figure
subplot(2,1,1);
stem(x);
subplot(2,1,2);
stem(y2);

%% Problem 2d
h3 = zeros(1,10);

for i = 1:10
    if (i == 1) || (i == 3)
        h3(i) = 1;
    end
end

y3 = myConv(x, h3);

figure
subplot(4,1,1);
stem(x);
subplot(4,1,2);
stem(y3);
subplot(4,1,3);
stem(y1);
subplot(4,1,4);
stem(y2);
end