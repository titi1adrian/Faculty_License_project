function x = modulare(x_0, Nbps)
%modulatie qam
%Nbps -> QPSK - 2 8QAM - 3 16QAM - 4

M=2^Nbps;
norms=sqrt(2/3*(M-1));
[useri,biti]=size(x_0);
t1 =reshape(x_0',Nbps,useri*biti/Nbps)';
t2 =bi2de(t1,'left-msb');
user_mod1=qammod(t2,M,0,'gray')/norms;
x=reshape(user_mod1,biti/Nbps,useri).';
end

