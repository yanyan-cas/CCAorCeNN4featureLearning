function cenn = cennFeedForward(cenn, x)
   
n = cenn.n;
equ = cenn.equ;

for i = 1 : equ
    cenn.U{1}{i} = x;
end 

for i = 2 : n
    for j = 1 : equ
        
        switch cenn.layers{i-1}.type 
            case 'cenn'
               %convolution with random template
               convTemplate = rand(3, 3);
               evolveStageOne =  stateCal1(convTemplate, cenn.U{i-1}{j});
               %Rectified Linear Units template
               evolveStageTwo = stateCal2(reluTemplate, evolveStageOne);
               %Pooling Template
               evolveStageThree = stateCal3(poolingTemplate, evolveStageTwo);     
               
               cenn.U{i}{j} = evolveStageThree;
            case 'softmax'
%                 [a,b, ~] = size(cenn.U{i-1}{j});
%                 c = ceil(a/cenn.layers{i-1}.scale) * cenn.layers{i-1}.scale;
%                 d = ceil(b/cenn.layers{i-1}.scale) * cenn.layers{i-1}.scale;
%                 uadd = padarray(cenn.U{i-1}{j},[c-a,d-b,0],'replicate','post');
%                 
%                 if strcmp(pde.layers{i-1}.function, 'max')
%                         tt = strel('rectangle',[pde.layers{i-1}.scale,pde.layers{i-1}.scale]);
%                         star =  ceil((pde.layers{i-1}.scale +1)/2);
%                         z = imdilate(uadd,tt);
%                         pde.U{i}{j} =z(star:pde.layers{i-1}.scale:end,star:pde.layers{i-1}.scale:end,:);
%                 else
%                         z = convn( uadd, ones(pde.layers{i-1}.scale) / (pde.layers{i-1}.scale ^ 2), 'valid');   %  !! replace with variable
%                         pde.U{i}{j}= z(1 : pde.layers{i-1}.scale : end, 1 : pde.layers{i-1}.scale : end, :);
%                 end                
        end
                
       
        
        
        
        
        
    end
    
    
end




end