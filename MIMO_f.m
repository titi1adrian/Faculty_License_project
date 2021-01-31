function ber = MIMO_f(N,M,tip_f,Nbps,rap_dB)
rep = 5000;             % Numar de repetitii

bit=randi([0,1],M,rep*Nbps); % semnalul mesaj
bit_mod= modulare_MQAM(bit, Nbps); % semnalul modulat
 
for j1=1:length(rap_dB)   
    rsz_db=rap_dB(j1);              

    for k1=1:rep 
        y(:,k1) = MASSIVE_MIMO_f(rsz_db,N, bit_mod(:,k1),M,tip_f);
    end
    
    bit_demod= demodulare_MQAM(y, Nbps); % demodulare
    
    ne_lin=0;
    [ex,ey] = find(bit~=bit_demod);
    ne_lin = length(ex);
    

    ber(:,j1) = ne_lin/(length(bit_demod)*M); % depozitarea valorii BER in vector

end
end