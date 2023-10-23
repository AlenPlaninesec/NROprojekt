function [znotraj_kroga, znotraj_kvadrata] = mcc_pi(n)
    % Funkcija za Monte Carlo metodo računanja približka števila π.

    % Generiranje naključne točke v kvadratu [-1, 1] x [-1, 1]
    x = rand(1, n)*2-1;
    y = rand(1, n)*2-1;

    % Preverjanje, katere točke so znotraj kroga
    notraje_tocke = (x.^2 + y.^2 <= 1);

    % Koordinate točk znotraj kroga in kvadrata
    znotraj_kroga = [x(notraje_tocke); y(notraje_tocke)];
    znotraj_kvadrata = [x; y];
end