%
function[res, fval] = res_personnel(maxSalary)
    
    maxSalary = 6473.2;

	% matrice de contraintes avec ajout contraintes (Inegalitaire)
    A=[
       %Contraintes sur le temps des machines
       11,15,0,5,0,10; 
       0,1,2,8,7,12; 
       12,1,11,0,10,15; 
       2,10,5,4,13,7; 
       15,0,0,0,10,25; 
       5,5,13,12,8,0; 
       5,3,5,28,0,7;
       %Contraintes sur les besoin en matieres premieres
       1,1,1,5,0,2;
       2,2,1,0,2,1;
       1,0,3,2,6,0;
     ];
    
    %Contraintes d'egalite sur le benefice
    Aeq = [13.5667, 7.9833, 15.9333, 16.4333, 23.6500, 9.9500];
    
    
	% Calcul du vecteur de la fonction a minimiser : temps des machines
	f = [1 0 0 0 1 0 0 0 0 0] * A;

	%contraintes de domaine nb(i) >= 0
	lb = zeros(6,1);

	% vecteur des 2nd membres
    b = [4800; 4800; 4800; 4800; 4800; 4800; 4800; 650; 820; 585];
    
    for i=1:100
        %Le poucentage du benefice maximum a respecter
        beq = [i/100 * maxSalary];
        
        % fval -> l'opposé du bénéfice  
        [nbX, fval] = linprog (f, A, b, Aeq, beq, lb);
        
        %On recupere le temps des machines 1 et 5 en multipliant les produits par
        %leur temps passe sur ces derniere
        timeMac1 = 0;
        timeMac2 = 0;
        for j=1:length(nbX)
           %On utilise la matrice des contraintes pour obtenir les temps
           %par produit : A(row, 1) pour la machine 1
           timeMac1 = timeMac1 + nbX(j, 1) * A(j, 1);
           timeMac2 = timeMac2 + nbX(j, 1) * A(j, 5);
        end
        res(i, 1) = timeMac1;
        res(i, 2) = timeMac2;
        res(i, 3) = timeMac1 + timeMac2;
    end
    
    plot(res)
    legend('machine 1', 'machine 5', 'machine 1 et 5', 'Location', 'NorthWest');
    ylabel('Temps d''utilisation (min)');
    xlabel('Pourcentage du benefice');
