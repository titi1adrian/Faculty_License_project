function y_0 = demodulare(data, Nbps)
%modulatie qam
%Nbps -> QPSK - 2 8QAM - 3 16QAM - 4

M=2^Nbps;
norms=sqrt(2/3*(M-1));
[useri,date]=size(data);
t1 =reshape(data.',1,date*useri).';
t2=qamdemod(t1*norms,M,0,'gray');
t3 =de2bi(t2,'left-msb');
y_0=reshape(t3',date*Nbps,useri)';
end
 