function [s0_RF] = EPG_sim_offload(flipmat, phi,RF,tissue)
%% Parfor wrapper for EPG simulation to offload to remote machine
s0_RF = zeros(size(flipmat));
parfor zz = 1:size(flipmat,2)
    if ~sum(flipmat(:,zz)) == 0
        s0_RF(:,zz) = EPG_GRE(flipmat(:,zz),phi,RF.TR,tissue.T1,tissue.T2,'kmax',100);
    end
end

end

