function ber = SISO_f(tip_f,Nbps,rap_dB)
% y = h*x + n
N = 10^6*1.2; % numarul de biti

x_0 = rand(1,N)>0.5; % genereaza vector cu N elem daca x>0.5 =>1 ; x<0.5 => 0
x = modulare(x_0, Nbps); 
 
n = 1/sqrt(2)*(randn(1,N/Nbps) + 1i*randn(1,N/Nbps)); % zgomotul alb Gaussian

switch tip_f
    case 1
% Rayleigh
h = 1/sqrt(2)*(randn(1,N/Nbps) + 1i*randn(1,N/Nbps)); % canalul afectat de fading Rayleigh
    case 2
% Rice
K = 2;
sigma = 1;
[h,~] = rice_fading_siso(sigma,K, N/Nbps);
    case 3
%Nakagami
m=1;
omega=1;
h = nakagami_fading_siso(m,omega, N/Nbps);
end

for i = 1:length(rap_dB)

   % generarea iesirii 
   y = h.*x + 10^(-rap_dB(i)/10)*n; 

   % eliminarea efectului canalului
   y_1 = y./h;
   
   % obtinerea semnalului demodulat
   y_0 = demodulare(y_1, Nbps);

   % calcularea erorilor
   nr_erori(i) = size(find(x_0 - y_0),2);

end

ber = nr_erori/N; % rata erorilor de bit BER


end





