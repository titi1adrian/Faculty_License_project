function [ user_demod ] = demodulare_MQAM(data, Nbps)
%demodulatie qam
M=2^Nbps;
norms=sqrt(2/3*(M-1));
[useri,date]=size(data);
t1 =reshape(data.',1,date*useri).';
t2=qamdemod(t1*norms,M,0,'gray');
t3 =de2bi(t2,'left-msb');
user_demod=reshape(t3',date*Nbps,useri)';
end
 