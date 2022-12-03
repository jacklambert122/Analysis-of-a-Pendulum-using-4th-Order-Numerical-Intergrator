function [x1,t1] = RK4(odeCall,t0,h,n,x0)
    %% Initializing 
    x1 = zeros(n,length(x0));
    x1(1,:) = x0;
    
    t1 = zeros(n,1);
    t1(1) = t0;
    %% Iterating through different steps
    for i = 1:n
        k1 = (h*odeCall(x0,t0));
        k2 = (h*odeCall(x0 + 1/2 * k1',t0 + h/2));
        k3 = (h*odeCall(x0 + 1/2 * k2',t0 + h/2));
        k4 = (h*odeCall(x0 + k3',t0 + h));
        x0 = x0 + (1/6) * (k1' + 2*k2' + 2*k3' + k4');
        x1(i+1,:) = x0;
        t1(i+1) = t1(i) + h;
            
    end
        

end

