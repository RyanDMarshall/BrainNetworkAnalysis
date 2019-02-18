function ai_write_nodes(fname, comm, rois)

fname = [fname '.node'];

nrois = length(rois);

for iroi = 1:nrois
    
    [netid{iroi}, remain] = strtok(rois{iroi},'_');
    
    [x{iroi}, remain] = strtok(remain,'_');
    [y{iroi}, remain] = strtok(remain,'_');
    [z{iroi}, remain] = strtok(remain,'_');
    
end

fid = fopen(fname,'w');

% fprintf(fid, ['#' fname ' -- x, y, z, comm, size, netid\n']);

for iroi = 1:nrois
    
    fprintf(fid, '%s\t%s\t%s\t%s\t%s\t%s\n',...
        x{iroi},y{iroi},z{iroi}, num2str(comm(iroi)), '1', netid{iroi});
    
end

fclose(fid);
