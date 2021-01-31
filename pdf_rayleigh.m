clc
clear all
close all

N = 100000; 
x = randn(1, N);
y = randn(1, N); 

sigma=sqrt(0.5);

 r=sigma*(x+1i*y); % fading Rayliegh
% sau r=(normrnd(0,sigma,1,N)+1i*normrnd(0,sigma,1,N));
        
r_abs=abs(r);
step = 0.1;
range = 0:step:3;

h = hist(r_abs, range);
fr_aprox = h/(step*sum(h));
fr_teoretic = raylpdf(range,sigma);

plot(range, fr_aprox,'ko', range, fr_teoretic,'k');hold on
grid; 

m=1;
omega=1;
y1=gamrnd(m,(omega*2)/(2*m),1,N);
rr=sqrt(y1);
r_abs=abs(rr);
h = hist(r_abs, range);
fn_aprox = h/(step*sum(h));
plot(range, fn_aprox,'bo')

legend('fr aprox','fr teoretic')
