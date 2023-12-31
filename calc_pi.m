function calc_pi()
    n=100000;
    [pi_priblizek, napaka] = area_pi(n);
    disp(['Približek števila pi:', num2str(pi_priblizek)])
    disp(['Napaka', num2str(napaka)])
    figure(n)
end



function figure(n)
     x = rand(1,n)*2-1;
     y = rand(1,n)*2-1;
     radij = sqrt(x.^2 + y.^2);  
     znotraj_kroga = radij <= 1;

    
     scatter(x(znotraj_kroga), y(znotraj_kroga), 10, 'r', '+');  
     hold on;
     scatter(x(~znotraj_kroga), y(~znotraj_kroga), 10, 'b', 'o'); 
     hold off;

    koren = @(x) sqrt(1-x.^2); %definiranje anonimne funkcije
    xx=linspace(-1, 1, 400);
    %r = 1;
    %x_circle = r * cos(theta);
    %y_circle = r * sin(theta);
    
    hold on;
    axis equal
    plot(xx, koren(xx), 'k', 'LineWidth', 4);
    hold on;
    plot(xx, -koren(xx), 'k', 'LineWidth', 4);
    hold on;
    
    %Izris kvadrata
    T0=[1,1];
    T1=[1,-1];
    T2=[-1,-1];
    T3=[-1,1];
   
    plot(T1,T0,"k",'LineWidth', 2)
    hold on;
    plot(T1,T2,"k",'LineWidth', 2)
    hold on;
    plot(T0,T3,"k",'LineWidth', 2)
    hold on;
    plot(T2,T3,"k",'LineWidth', 2)
    hold off;

    title('Naključno generirane točke na krožnici z lokom');
    xlabel('X-os');
    ylabel('Y-os');
    legend('Znotraj krožnice', 'Zunaj krožnice', 'Krožnica');
end


function [pi_priblizek, napaka] = area_pi(n)     
   zunaj=0;
   notri=0;
    for i=1:n
        x = rand();
        y = rand();
            if (x^2+y^2)<=1
                notri=notri+1;
            else
                zunaj=zunaj+1;
            end
    end
  pi_priblizek=4*notri/n;
  napaka=abs(pi_priblizek-pi);
end