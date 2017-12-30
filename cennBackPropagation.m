function cenn = cennBackPropagation(cenn, x, y)

    n = cenn.n;
    equ = cenn.equ;
    m = size(x, 3)
    
    outputSize = size(cenn.U{n}{1});
    temp = outputSize(1) * outputSize(2);
    fea = zeros(temp*equ, m);
    for j = 1: equ
        fea(temp*(j-1)+1:temp*j,:)=reshape(cenn.U{n}{j}, temp,m);
    end
    fea = [ones(1, m); fea];
    
    fea=[ones(1,m);fea];
    cenn.W=y*fea'*inv(fea*fea'+diag([1 cenn.lambda*ones(1,temp*equ)]));

    cenn.error = sum(sum((y-cenn.W*fea).*(y - cenn.W*fea)))/m;
       
    
    dU = - cenn.W' * (y - cenn.W * fea) / m;
    dU = dU(2 : end, :);
    ddU = cell(equ, 1);
    
    for j = 1 : eq
        ddU{j} = reshape(dU(temp*(j-1)+1:temp*j,:),outputsize(1),outputsize(2),outputsize(3));
    end
    
    
    %% numerical derivative
    for i = (n-1) : -1 : 1
        ddUlast = cell(equ, 1);
        
        for j = 1 : equ
            if i > 1 && strcmp(cenn.layers{i}.type, 'softmax')
                
            else
            
            
        
        
        
        
        end
    end
    
    
    
    
    
    
end