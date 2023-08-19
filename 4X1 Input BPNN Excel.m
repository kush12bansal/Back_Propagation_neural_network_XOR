filename = 'data2.xlsx';
sheet = 1;
xlRange = 'A2:D17';

X = xlsread(filename,sheet,xlRange)
xlRange = 'E2:E17';
Y = xlsread(filename,sheet,xlRange)

% Initialize weights and biases
W1 = randn(4,3); % weights for hidden layer
b1 = randn(1,3); % biases for hidden layer
W2 = randn(3,1); % weights for output layer
b2 = randn(1,1); % bias for output layer

% Set learning rate and number of iterations
lr = 0.00001;
epochs = 10000;

% Define sigmoid activation function
sigmoid = @(x) 1./(1+exp(-x));

% Train the network
for i = 1:epochs
    % Forward pass
    hidden_layer_input = X * W1 + b1;
    hidden_layer_output = sigmoid(hidden_layer_input);
    output_layer_input = hidden_layer_output * W2 + b2;
    output_layer_output = sigmoid(output_layer_input);
    
    % Backward pass
    error = Y - output_layer_output;
    d_output = error .* output_layer_output .* (1 - output_layer_output);
    d_hidden = (d_output * W2') .* hidden_layer_output .* (1 - hidden_layer_output);
    
    % Update weights and biases
    W2 = W2 + lr * hidden_layer_output' * d_output;
    b2 = b2 + lr * sum(d_output);
    W1 = W1 + lr * X' * d_hidden;
    b1 = b1 + lr * sum(d_hidden);
end

% Test the network
X=[0.1,.4,.7,.9]; % check with input from user
hidden_layer_input = X * W1 + b1;
hidden_layer_output = sigmoid(hidden_layer_input);
output_layer_input = hidden_layer_output * W2 + b2;
output_layer_output = sigmoid(output_layer_input);
disp(output_layer_output);

