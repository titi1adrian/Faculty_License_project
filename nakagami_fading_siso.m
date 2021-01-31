function h = nakagami_fading_siso(m,omega, N)
% fadingului Nakagami x=gamma(m,g/m)
% gamrnd - functie predefinita pentru generarea functiilor gamma
% omega - parametrul ce caracterizeaza distributia Nakagami

y1=gamrnd(m/2,(omega*2)/(2*m),1,N);
y2=gamrnd(m/2,(omega*2)/(2*m),1,N);

h=sqrt(y1)+1i*sqrt(y2);

end
