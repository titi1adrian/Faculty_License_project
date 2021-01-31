clc
clear all
close all

N = 100000; 

sigma=sqrt(2);
v=1;

step = 0.1;
range = 0:step:6;

f_teoretic=(range./sigma^2).*exp(-(range.^2.+v^2)./(2*sigma^2)).*besseli(0,(range.*v)./sigma^2);

K = v^2/(2*sigma^2); 
Kdb=10*log10(K);

const =sqrt(K/(K+1));
x = const+sigma*randn(1, N);
y = sqrt(K*2*sigma^2-const)+sigma*randn(1, N); 
r=x+1i*y;
        
r_abs=abs(r);

h = hist(r_abs, range);
f_aprox = h/(step*sum(h));

plot(range,f_teoretic,'b','LineWidth',1.5); hold on;
plot(range, f_aprox,'ko');
legend('rice teoretic','rice aprox')
grid; 
