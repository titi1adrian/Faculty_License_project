function [ user_mod ] = modulare_MQAM(data, Nbps)
%modulatie qam
M=2^Nbps;
norms=sqrt(2/3*(M-1));
[useri,biti]=size(data);
t1 =reshape(data',Nbps,useri*biti/Nbps)';
t2 =bi2de(t1,'left-msb');
user_mod1=qammod(t2,M,0,'gray')/norms;
user_mod=reshape(user_mod1,biti/Nbps,useri).';
end

