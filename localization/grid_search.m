clear; clc; close all;

% A terrifically large search! Ah!
% Search a 10 x 10 x 10 quarter-cube, sidelength 3 m
% SNR in [0 10 20]
% dol in [.25 .5 .75]
% this is a 5-dimensional object. Dimensions are as follows:
% DIM 1-3: X,Y,Z 
% DIM 4: SNR
% DIM 5: d/lambda
% altogether 10*10*10*3*3 = 9,000

btwn_arrays = 0.8;
lambda = 3e8/915e6;
num_samples = 1e3;
grid_res = 200;

N = 10; %number of points in each dim of gridsearch

lin = linspace(sqrt(2)/100,3,N);

[X,Y,Z] = ndgrid(lin,lin,lin);
errors = zeros(10,10,10,3,3);
SNRs = [0 10 20];
dols = [0.25 0.5 0.75];

%%
l = 0;
f = waitbar(0,"You're doing great, kid");
for i = 1:N %X
    for j = 1:N %Y
        for k = 1:N %Z
            for m = 1:3 %SNR
                for n = 1:3 %dol
                    
                    SNR = SNRs(m);
                    dol = dols(n);
                    d = dol*lambda;
                    co  = 0:2;
                    co = co*d;
                    [X1,Y1]=meshgrid(co,co);
                    x=reshape(X1,1,[]); y=reshape(Y1,1,[]);
                    % columns represent different position vectors
                    r1=[x;y;zeros(size(x))];     %Antenna locationa
                    r2 = r1;
                    r2(1,:) = r2(1,:) + btwn_arrays;
                    
                    tags = [X(i,j,k) Y(i,j,k) Z(i,j,k)];
            
                    [~, p1, ~, ~] = func_musicboi(num_samples, tags, dol, SNR, grid_res,r1);
                    [~, p2, ~, ~] = func_musicboi(num_samples, tags, dol, SNR, grid_res,r2);
            
                    if all(size(p1) == size(p2)) && size(p1,2) == 1 %(numtags)
                        loc = angles2location(r1,p1(1,:),p1(2,:),r2,p2(1,:),p2(2,:),false);
                        errors(i,j,k,m,n) = norm(tags - loc);
                    else
                        errors(i,j,k,m,n) = inf+1;
                    end
                    l = l+1;
                    [i j k m n errors(i,j,k,m,n)]
                    waitbar(l/9000,f);
                end
                save('HUGESEARCH.mat','errors');
            end
        end
    end
end
close(f)
