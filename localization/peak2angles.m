%{
returns polar and azimuthal angles from music spectrum

inputs:
    S_music: music spectrum of data
    num_sources: number of peaks / tags to find
    theta_vec: vector of polar angles (degs), -180 -> 180
    phi_vec: vector of azimuthal angles (degs), 0 -> 90

outputs:
    AOAs: (2 x num_sources) found AOAs of tags
        AOAs(1,:) = polar angles (degs)
        AOAs(2,:) = azimuthal angles (degs)
%}

function AOAs = peak2angles(S_music, num_sources, theta_vec, phi_vec)
[pm, cm] = FastPeakFind( abs(S_music).^2 );
[~, I] = maxk( abs(S_music(logical(cm))).^2, num_sources );
pm = reshape(pm,2,[]);
AOAs = pm(:,I);

AOAs(1,:) = theta_vec(AOAs(1,:));
AOAs(2,:) = phi_vec(AOAs(2,:));

pol = AOAs(1,:);
pol = (pol>0).*(pol-180) + (pol<=0).*(pol+180);
AOAs(1,:) = pol;
end