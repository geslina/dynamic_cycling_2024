% The fitting results may vary slightly with each run due to the use of the PSO algorithm.
clear all
clc

co2_index={'Cell_053'};

data_cell_QLi=load('../data/all_cells_QLi.mat');
cell_use=eval(['data_cell_QLi.',co2_index{1}]);


data_cell_SOH=load('../data/all_cells_SOH.mat');
cell_check=eval(['data_cell_SOH.',co2_index{1}]);

cutindex=min(find(cell_check(2,:)<0.90));

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


%%
see_x=data.fit_use_EFC;
see_y=x_opt(1)+x_opt(2)*see_x.^x_opt(4)+x_opt(3)*see_x;

col1=[152 0 0]/255;      
col2=[112 128 144]/255;
figure
plot(see_x,see_y, '-','LineWidth',2,'color',col2); 
hold on
plot(data.fit_use_EFC,data.fit_use_Qli, 'o','LineWidth',2,'color',col1, 'MarkerFaceColor', col1); 

xlabel( 'EFCs [-]');
ylabel( 'QLi [-]');

legend('Fitted','Cell 53')



set(gca,'linewidth',1,'fontsize',14,'fontname','Arial');
set(gcf,'unit','centimeters','position',[5 5 10 6])

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