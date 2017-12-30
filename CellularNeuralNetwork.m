function [cenn] = CellularNeuralNetwork(cenn, train_x, train_y, val_x, val_y, opts)

m = size(train_x, 3);

cenn.batchsize = opts.batchsize;

%%step1 initialization
[cenn] = cennInitial(cenn);

[cenn.valAccuracy] = cennEvaluation(cenn, train_x, train_y, val_x, val_y, cenn.lambda);

disp([' Original Val accurate is ' num2str(cenn.val_acc)]);


%step2 Training
numepochs = opts.numephochs;
numbatches = m / cenn.batchsize;
cenn.testvalAccuracy = [ ];

n = 1;
for i = 1 : numepochs
    tic;
    kk = randperm(m);
    
    for l = 1 : numbatches
        batch_x = train_x(:,:,kk((l - 1) * pde.batchsize + 1 : l * pde.batchsize));        
        batch_y = train_y(:,kk((l - 1) * pde.batchsize + 1 : l * pde.batchsize));
        
        cenn = cennFeedForward(cenn, batch_x);
        cenn = cennBackPropagation(cenn, batch_x, batch_y);
        cenn = cennApplyGrads(cenn);
        n = n + 1;
    end
    
    t = toc;
    
    
    
    
    
end
end
