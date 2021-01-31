close all
clear all
clc
% y = h*x + n
N = 10^6 % numarul de biti

x_0 = rand(1,N)>0.5; % genereaza vector cu N elem daca x>0.5 =>1 ; x<0.5 => 0
x = modulare(x_0, 2); 
 
rap_dB = 0:2:30; % raportul dintre energia bitilor si zgomot exprimat in dB

n = 1/sqrt(2)*(randn(1,N/2) + 1i*randn(1,N/2)); % zgomotul alb Gaussian
K = 2;
sigma = 1;
[h,Kdb] = rice_fading(sigma,K, N/2);

for i = 1:length(rap_dB)

   % generarea iesirii 
   y = h.*x + 10^(-rap_dB(i)/10)*n; 

   % eliminarea efectului canalului
   y_1 = y./h;
   
   % obtinerea semnalului demodulat
   y_0 = demodulare(y_1, 2);

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
title('Caracteristica canalului afectat de fading Rice');
%}

figure(2)
semilogy(rap_dB,BER,'ro-','LineWidth',2);
grid on
legend('Canal Rice Simulat');
xlabel('Eb/No [dB]');
ylabel('Rata Erorii de Bit');
title('BER Pentru un semnal modulat QPSK print-un canal afectat de fading Rice');








