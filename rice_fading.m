function [h,Kdb] = rice_fading(sigma,K, N,M)
% anvelopa fadingului Rice este data de |h|=sqrt(X^2+Y^2)
% X si Y sunt variabile aleatoare cu dispersia sigma
% K este parametrul ce caracterizeaza distributia Rice

disp=sqrt(sigma);
Kdb=10*log10(K);
const =sqrt(K/(K+1));

x = const+disp*randn(N, M);
y = sqrt(K*2*disp^2-const)+disp*randn(N, M); 
h=x+1i*y;
end
