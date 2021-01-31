close all
clear all
clc
% y = h*x + n
N = 10^6 % numarul de biti

x_0 = rand(1,N)>0.5; % genereaza vector cu N elem daca x>0.5 =>1 ; x<0.5 => 0
x = 2*x_0-1; % Modulatie BPSK 0 => -1; 1 => 0 
 
rap_dB = 0:2:30; % raportul dintre energia bitilor si zgomot exprimat in dB

n = 1/sqrt(2)*(randn(1,N) + 1i*randn(1,N)); % zgomotul alb Gaussian

for m = 1:1:5; 
omega=1;
h = nakagami_fading(m,omega, N);

for i = 1:length(rap_dB)

   % generarea iesirii 
   y = h.*x + 10^(-rap_dB(i)/10)*n; 

   % eliminarea efectului canalului
   y_1 = y./h;
   
   % obtinerea semnalului demodulat
   y_0 = real(y_1)>0;

   % calcularea erorilor 
   nr_erori(i) = size(find(x_0 - y_0),2);

end

BER = nr_erori/N; % rata erorilor de bit BER

% Afisarea rezultatelor
%{
figure(1)
hist(abs(h),100);
legend('Caracteristica canalului');
xlabel('Timp');
ylabel('Amplitudine');
title('Caracteristica canalului afectat de fading Nakagami');
%}

figure(2)
semilogy(rap_dB,BER,'LineWidth',2);
hold on
grid on
legend('m = 1','m = 2','m = 3','m = 4','m = 5');
xlabel('Eb/No [dB]');
ylabel('Rata Erorii de Bit');
title('BER Pentru un semnal modulat BPSK print-un canal afectat de fading Nakagami');


end





