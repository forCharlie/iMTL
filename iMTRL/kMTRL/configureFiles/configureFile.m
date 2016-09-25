
configurePara = struct(...
'inDataDir',  '../../../../AllData/multi_task/datas/',...
'resultDir',  '../../../../AllData/multi_task/results/',...        
...
...
...
'MTRL', struct(...
                   'inDataDir', '../../../../AllData/kMTRL/syn/',...
                   'resultDir', '../../../../AllData/kMTRL/syn/',...
                   'maxIter',     100,...     % outer
                   'tunedParas', struct(...               
                                'lambda1s'  ,  [1e-3],...
                                'lambda2s' ,   [0,1e-3,1e-2,1e-1,1,10,100,1e+3]... %0,1e-3,1e-2,1e-1,1,10,100,1e+3
                                 )...
                    ),...
'kMTRL_CVX_active_learning',   struct(...
                   'inDataDir', '../../../../AllData/kMTRL/syn/',...
                   'resultDir', '../../../../AllData/kMTRL/syn/',...
                   'maxIter',     100,...     % outer
                   'tol',         1e-5,...    
                   'c',           0.0001, ...              % constraint const in projection algorithm
                   'tunedParas', struct(...
                                'lambda1s'  ,  [1e-3],...% 0  ,1e-3,1e-2,1e-1,1,10,100 ,1e+3 
                                'lambda2s' ,   [0,1e-3,1e-2,1e-1,1,10,100,1e+3]... 
                                 )...
                    ),...                    
'kMTRL_FISTA_active_learning',   struct(...
                   'inDataDir', '../../../../AllData/kMTRL/syn/',...
                   'resultDir', '../../../../AllData/kMTRL/syn/',...
                   'maxIter',     100,...     % outer
                   'tol',         1e-5,...    
                   'c',           0.0001, ...              % constraint const in projection algorithm
                   'Fista_options', struct(...
                                            'bFlag', 0,...
                                            'tFlag', 0,...
                                            'tol',   1e-12,...
                                            'maxIter', 1000 ...
                                            ),...
                   'tunedParas', struct(...
                                'lambda1s'  ,  [1e-3],...% 0  ,1e-3,1e-2,1e-1,1,10,100 ,1e+3 
                                'lambda2s' ,   [0,1e-3,1e-2,1e-1,1,10,100,1e+3]... 
                                 )...
                    ),...
'kMTRL_kernel_activelearning', struct(...
                   'inDataDir', '../../../../AllData/kMTRL/syn/',...
                   'resultDir', '../../../../AllData/kMTRL/syn/',...
                   'maxIter',     200,...     % outer
                   'c',           0.0001,...
                   'tunedParas', struct(...
                                'lambda1s'  ,  [1e-3,1e-2,1e-1],...
                                'lambda2s' ,   [0,1e-3,1e-2,1e-1,1,10,100,1e+3]... %0,1e-3,1e-2,1e-1,1,10,100,1e+3
                                 )...
                    ),...
'kMTRL_kernel_random', struct(...
                   'inDataDir', '../../../../AllData/kMTRL/syn/',...
                   'resultDir', '../../../../AllData/kMTRL/syn/',...
                   'maxIter',     200,...     % outer
                   'c',           0.0001,...
                   'tunedParas', struct(...
                                'lambda1s'  ,  [1e-3,1e-2,1e-1],...
                                'lambda2s' ,   [0,1e-3,1e-2,1e-1,1,10,100,1e+3]... %0,1e-3,1e-2,1e-1,1,10,100,1e+3
                                 )...
                    )...                    
);
       
 
                