%{ 
inputs:
    ant_loc = (3xM) M antenna locations 
    tag_loc = (3xN) N RFID tag locations

outputs:
    theta = (MxN) relative polar angles (degs) between ants and tags
    phi   = (MxN) relative azimuthal angles (degs) ...
%} 

function [theta, phi] = relativeAngle(ant_loc, tag_loc)
M = size(ant_loc,2);
N = size(tag_loc,2);

theta = nan(M,N);
phi   = nan(M,N);

for k=1:N
    % vector difference between antenna and tag locations
    diff = (repmat(tag_loc(:,k), 1, M) - ant_loc)';
    % finding polar angle
    theta(:,k) = atand(diff(:,2)./diff(:,1));
    
    %Adjust the phis so that they are relative to the x axis
    theta(:,k) = (diff(:,1)>=0).*theta(:,k) + (diff(:,1) < 0).*...
        ((diff(:,2)>=0).*(180 + theta(:,k)) + (diff(:,2)<0).*...
        (theta(:,k)-180));
      
    dist = vecnorm(diff,2,2);
    phi(:,k) = acosd(diff(:,3)./dist);
end

end