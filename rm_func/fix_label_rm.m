%% Relabels Variables for Consistency Checking

%% FUNCTION:
% For use in checking partition consistency. This appends the proper
% iteration label to every variable in the workspace, e.g. "commNodeYA1"
% becomes "commNodeYA1_1" on iter 1, "commNodeYA1_2" on iter 2, etc.

%% REQUIRES: 
% 'fname' is the filename containing the workspace with the variable names
%       you would like to change
% 'iter' is the iteration index, i.e. the numeric label appended to the end
%       of each variable name.

function [] = fix_label_rm(fname, iter)
    
    x = load(fname);
    label = int2str(iter);

    names = fieldnames(x);
    for iname = 1:length(names)
        name = names{iname};
        x.([name(1:end-3), '_', label]) = x.(names{iname});
        x = rmfield(x, names{iname});
        %if ~(name(end) >= '0' && name(end) <= '9' && name(end-1) == '_')
            %x.([names{iname}, '_', label]) = x.(names{iname});
            %x = rmfield(x, names{iname});
        %end
    end

    save(fname, '-struct', 'x');
    clear;