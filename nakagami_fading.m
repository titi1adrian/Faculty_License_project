function h = nakagami_fading(m,omega, N, M)
% fadingului Nakagami x=gamma(m,g/m)
% gamrnd - functie predefinita pentru generarea functiilor gamma
% omega - parametrul ce caracterizeaza distributia Nakagami

y1=gamrnd(m/2,(omega*2)/(2*m),M,N);
y2=gamrnd(m/2,(omega*2)/(2*m),M,N);

h=sqrt(y1)+1i*sqrt(y2);

end
