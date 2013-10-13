function [X, fval] = resp_comptable()

    A=[11,15,0,5,0,10; 0,1,2,8,7,12; 12,1,11,0,10,15; 2,10,5,4,13,7; 15,0,0,0,10,25; 5,5,13,12,8,0; 5,3,5,28,0,7;1,1,1,5,0,2; 2,2,1,0,2,1; 1,0,3,2,6,0];
    b=[4800; 4800; 4800; 4800; 4800; 4800; 4800; 650; 820; 585];
    lb=[0; 0; 0; 0; 0; 0];

    %prix de vente du produit fini
    pv=[28; 20; 30; 37; 45; 22];

    %quantité de matière première par produit
    mp=[1,1,1,5,0,2; 2,2,1,0,2,1; 1,0,3,2,6,0];

    %prix d'achat de matières premières
    pam=[3,4,2];

    %temps unitaire d'usinage d'un produit pour une machine en minute
    tm=[11,15,0,5,0,10; 0,1,2,8,7,12; 12,1,11,0,10,15; 2,10,5,4,13,7; 15,0,0,0,10,25; 5,5,13,12,8,0; 5,3,5,28,0,7];

    %Coût à la minute des machines
    cm=[2,2,1,1,2,3,1]/60;

    f=-(pv-(pam*mp)'-(cm*tm)')


    [X,fval]=linprog(f,A,b,[],[],lb)

end