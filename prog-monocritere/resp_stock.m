function [nbX, fval] = resp_stock()
    %matrice des besoins en matières premières
    B = [1 1 1 5 0 2; 2 2 1 0 2 1; 1 0 3 2 6 0];
    %vecteur de la fonction à minimiser ( minim stock). 
    f = ones(1,6) + [ 1 1 1 ]* B;
    %matrice de contraintes avec ajout contrainte sur les bénéfices 
    A = [
        11,15,0,5,0,10;
        0,1,2,8,7,12;
        12,1,11,0,10,15;
        2,10,5,4,13,7;
        15,0,0,0,10,25;
        5,5,13,12,8,0;
        5,3,5,28,0,7;
        1,1,1,5,0,2;
        2,2,1,0,2,1;
        1,0,3,2,6,0;
        -13.5667, -7.98, -15.93,-16.43,-23.65,-9.95
    ];

    %contraintes de domaine nb(i) >= 0
    lb = zeros(6,1);
    % vecteur des 2nd membres.
    b=[4800; 4800; 4800; 4800; 4800; 4800; 4800; 650; 820; 585; -6473/2];
    % Calcul
    [nbX, fval] = linprog ( f, A, b,[],[],lb)
end

