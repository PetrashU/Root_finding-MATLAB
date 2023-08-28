function [x,k] = bisekcja(f,x0,x1,err)
    a = f(x0);
    k = 0;
    x_plot = linspace(-10,10,2000);
    figure(1)
    plot(x_plot,f(x_plot));
    title('Bisekcja')
    hold on
    while k == 0 || abs(x0-x1)>err
        k=k+1;
        x = (x0+x1)/2;
        scatter(x,f(x));
        y = f(x);
        if abs(f(x)) <= err
            break
        elseif a*y < 0
            x1 = x;
        else
            x0 = x;
        end
    end
    x = (x0+x1)/2;
    scatter(x,f(x));
    hold off
    disp (['Pierwiastek znaleziony metodą bisekcji = ', num2str(x)]);
    disp (['Bisekcja. Wartośc funkcji w miejscu pierwiastka = ', num2str(f(x))]);
    disp (['Bisekcja. Liczba iteracji = ', num2str(k)]);
end