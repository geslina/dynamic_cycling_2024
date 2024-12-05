% The fitting results may vary slightly with each run due to the use of the PSO algorithm.
clear all
clc

co16_index  = {
    'Cell_057'
    'Cell_058'
    'Cell_063'
    'Cell_064'    
};


sum_err=[];
for totkk=1:1:size(co16_index,1)
    

cell_choose=totkk;


data_cell_Qli=load('../data/all_cells_QLi.mat');
cell_use=eval(['data_cell_Qli.',co16_index{cell_choose}]);


data_cell_SOH=load('../data/all_cells_SOH.mat');
cell_check=eval(['data_cell_SOH.',co16_index{cell_choose}]);

cutindex=min(find(cell_check(2,:)<0.90));
QLi_end=cell_check(2,cutindex);

intx=cell_use(1,1:cutindex);
inty=cell_use(2,1:cutindex);



data.fit_use_EFC=intx;
data.fit_use_Qli=inty;


Initial_position=abs(rand(1,4));

Upper_bound=[1,Inf,Inf,0.5];
Lower_bound=[1,-Inf,-Inf,0.5];


% PSO setting
swarm_size=200; % num of particles
max_stalls=50;

[x_opt, fval, history] = pso_for_fitting(swarm_size, max_stalls, Initial_position, ...
    Lower_bound, Upper_bound,data);



sum_err(totkk)=fval;
end
save('./results_save_fig4/err_co16.mat','sum_err')
%%

function [x_opt, fval, history] = pso_for_fitting(swarm_size, max_stalls, Initial_position, Lower_bound, Upper_bound,data)

    history = [];

    
    options = optimoptions('particleswarm',...
                       'SwarmSize',swarm_size,...
                       'MaxStallIterations',max_stalls,...
                       'PlotFcn','pswplotbestf',...
                       'FunctionTolerance',0.5e-9,...
                       'InitialSwarmMatrix',Initial_position,...
                       'Display','iter',...
                       'SocialAdjustmentWeight',2,...
                       'SelfAdjustmentWeight',2, ...
                       'UseParallel',false, ...
                       'OutputFcn', @myoutput);

    [x_opt,fval,exitflag,output] = particleswarm(@(x) curvefitting_fun(x),...
        length(Initial_position), ...
    Lower_bound, Upper_bound, options);

        
    function stop = myoutput(optimValues,state)
        stop = false;

    end
    
    function J = curvefitting_fun(x) 

        
        a=x(1);
        b=x(2);
        c=x(3);
        d=x(4);

        warning off
    
        realx=data.fit_use_EFC;
        realy=data.fit_use_Qli;

        fity=a+b*realx.^d+c*realx;
            
       J=mape(fity,realy);

            
    end
end

