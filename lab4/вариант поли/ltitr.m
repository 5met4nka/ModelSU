function x = ltitr(A, B, U, x0)

    %// Number of rows in U is the number of time points
    num_points = size(U, 1);
    
    %// Number of columns in U is how many inputs we have
    num_inputs = size(U, 2);
    
    x = zeros(num_inputs, num_points); %// Pre-allocate output
    
    %// For each time point we have ...
    for idx = 1 : num_points
        x(:,idx) = x0; %// Output the corresponding time point
        x0 = A*x0 + B*U(idx,:).'; %// Compute next time point
    end
    x = x.';
end