function [] = resp_commercial(coef)
    
    %coef est 1 ou -1 en fonction si on fait ABC - DEF ou l'inverse
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
        coef*1, coef*1, coef*1, -1*coef, -1*coef, -1*coef
    ];

    b = [4800; 4800; 4800; 4800; 4800; 4800; 4800; 650; 820; 585; 0];
    lb = [0; 0; 0; 0; 0; 0];

    %maximiser le nombre de produits créés
    f=[-1, -1, -1, 1, 1, 1] * coef;
    [X,fval]=linprog(f, A, b, [], [], lb)

end
