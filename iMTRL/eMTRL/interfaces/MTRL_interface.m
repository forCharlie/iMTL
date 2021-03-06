function model = MTRL_interface(init,data,label,testX,testY,W_true, Options)
% this script tune the parameters of kMTRL and return the best model



tunedParas = Options.tunedParas;

% parallel computing parameters  %%%%%%%%%%%%%%%%%
lenPara = 1;
paraNames = fieldnames(tunedParas);
num_paras = length(paraNames);
len_paras = zeros(num_paras,1);
dividend  = ones(num_paras,1);   

para_i = cell(num_paras,1);
for i = 1:num_paras
    para_i{i} = getfield(tunedParas, paraNames{i});
    lenPara = lenPara*length(para_i{i});
    len_paras(i) = length(para_i{i});  % lenght of each parameter array
    
    if i ~= num_paras
        for jj = i+1:num_paras
            dividend(i) = dividend(i) * length(getfield(tunedParas, paraNames{jj}));
        end
    else
        dividend(i) = len_paras(i);
    end
end

%% Initialization
K = length(label);
d = size(data{1},2);
if isempty(init)
    Omega = eye(K);
init.Omega = Omega;
init.Omega_inv = pinv(Omega);
rng(1024)         % this random seed cannot be same as the one generate data.
W = rand(d,K);
init.W = W;
end

models = cell(lenPara,1);
RMSE   = zeros(lenPara,1);
train_RMSE   = zeros(lenPara,1);
normall   = zeros(lenPara,1);
final_func = zeros(lenPara,1);
%%% adjust the format of label to be consistant with the format in MTRL.
label_new = cell(K,1);
for i = 1:K
    yy = label{i};
    label_new{i} = yy';  
end

%% Grid search
parfor  i = 1:lenPara

        paras_indexs = zeros(num_paras,1); % the real index in each array
        for j = 1:num_paras
            if j == num_paras
                paras_indexs(j) = mod(i,len_paras(j));

            else
                temp = ceil(i/dividend(j));
                paras_indexs(j) = mod(temp,len_paras(j));
            end 
            if paras_indexs(j)== 0
                    paras_indexs(j) = len_paras(j);
            end
        end


        parameters = struct();
        for jj = 1:num_paras
            para_array = para_i{jj}; % current parameters arrays.
            parameters.(paraNames{jj}) = para_array(paras_indexs(jj)) ;
        end

        lambda1 = parameters.(paraNames{1});
        lambda2 = parameters.(paraNames{2});
        
        % MTRL(data,label,'linear',0,0.01,0.005)
        model_para = MTRL(init,data,label_new,'linear', 0, lambda1,lambda2);
        
        models{i}  = model_para;
        
        [RMSE(i),b]   = make_evaluation(testX,testY, model_para.W,model_para.b);
        [train_RMSE(i), b] = make_evaluation(data,label, model_para.W,model_para.b);
        normall(i) = norm(model_para.W-W_true,2);
        final_func(i) = model_para.func_all(end);
        
%         corrcov((model_para.Omega))
        
        
end
[~, index] = min(RMSE);
model = models{index};
model.index   = index;
model.RMSE    = RMSE;
model.train_RMSE    = train_RMSE;
model.normall = normall;
model.funcvals = final_func;
end