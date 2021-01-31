function [y] = MASSIVE_MIMO_f(rsz_db, N,bit_mod,M,f)

% Parametrii zgomot
rsz = exp(rsz_db*log(10)/10); % conversia din decibeli 
sigma = sqrt( (M)/rsz );      % deviatia standard a zgomotului

switch f
    
    case 1
    % Rayleigh
    H = (1/sqrt(2))*randn(N,M) + 1i*(1/sqrt(2))*randn(N,M); 

    case 2
    % Rice
    K = 2;
    sigma1 = 1;
    [H,Kdb] = rice_fading(sigma1,K, N,M);

    case 3
    % Nakagami
    m = 1;
    omega = 1;
    H_p = nakagami_fading(m,omega, N, M);
    H = H_p';
end
wn = sigma * (randn(N,1) + 1i*randn(N,1));   % zgomot alb Gaussian 
x = H*bit_mod + wn;                          % vectorul de la receptie 

% metoda de egazliare cu eroare medie patratica minina.
y=(H'*H+(2*sigma^2)*eye([M,M]))^(-1)*(H')*x;

end