format long g
y = @(x) -0.1*x.^3+50-0.02*exp(x);
[xb,kb] = bisekcja(y,-10,10,10^(-8));


x = linspace(-10,10,2000);
[xn,kn] = newton_raphson(y,-10,10^(-7),0,0.1);
figure(2)
plot(x,y(x))
title("Metoda Newtona-Raphsona")
hold on
scatter(xn,y(xn));
hold off
disp (['Pierwiastek znaleziony metodą Newtona-Raphsona = ', num2str(xn)]);
disp (['Newton-Raphson. Wartośc funkcji w miejscu pierwiastka = ', num2str(y(xn))]);
disp (['Newton-Raphson. Liczba iteracji = ', num2str(kn)]);


Metoda = {'Centralna';'Wstecz';'W przód'};
n_iteracji = [];
pierwiastki = [];
for i=0:2
    [xi,ki] = newton_raphson(y,-10,10^(-10),i,0.1);
    n_iteracji = [n_iteracji; ki];
    pierwiastki =[pierwiastki;xi];
end
table1 = table(Metoda,n_iteracji,pierwiastki);
disp(table1);
