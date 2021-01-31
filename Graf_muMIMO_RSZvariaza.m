clear
close all
clc
f = 1

rap_dB = 0:2:30; % Vector cu diferite valor pentru
rep = 5000;             % Numar de repetitii

M= 2;     % nr utilizatori
N= 2 ;     % numar de antene la receptie


Nbps = 1;  %BPSK QPSK 8QAM 16QAM

bit=randi([0,1],M,rep*Nbps); % semnalul mesaj
bit_mod= modulare_MQAM(bit, Nbps); % semnalul modulat

clearvars y
 
for j1=1:length(rap_dB)   
    rsz_db=rap_dB(j1);              

    for k1=1:rep 
        y(:,k1) = MASSIVE_MIMO_f(rsz_db,N, bit_mod(:,k1),M,f);
    end
    
    bit_demod= demodulare_MQAM(y, Nbps); % demodulare
    
    ne_lin=0;
    [ex,ey] = find(bit~=bit_demod);
    ne_lin = length(ex);
    

    ber(:,j1) = ne_lin/(length(bit_demod)*M); % depozitarea valorii BER in vector
    
    
end

% Afisare
figure(1)
semilogy(rap_dB, ber) 
hold on
grid on
legend('BPSK');
xlabel('Eb/No [dB]');
ylabel('Rata Erorii de Bit');
title('Rayleigh N = 2 M = 2');

