% Given Connectivity Matrix A, community affiliation vectors C_edge and
% C_node
function [] = plot_PD_given_link_rm(A, C_node, C_link, zMin, group, gamma)
    
    nodePart = nodePart_rm(ConstructEdgeMatrix_rm(A, C_link));

    for i=1:max(nodePart)
        idx(i) = {find(nodePart == i)};
    end

    P = participation_coef(A, C_node);
    D = module_degree_zscore(A, C_node);

    colors = distinguishable_colors(max(nodePart));
    
    figure
    hold on;
    for i=1:max(nodePart)
        if length(idx{i}) > 1
            fitpoly = fit(P(idx{i}), D(idx{i}), 'poly1');
            
            xlim( [-0.025, 1] )
            ylim( [-2    , 4] );
            plot(fitpoly);
        elseif isempty(idx{i})
            plot(-1, -1, '.', 'DisplayName', num2str(i));
            continue;
        end
           
        p(i) = plot(P(idx{i}), D(idx{i}),'.', 'Color', colors(i,:), ..., 
            'DisplayName', num2str(i));
    end
    y_line_1 = -2:0.005:zMin;
    y_line_2 = zMin:0.005:4;
    x_line = -0.025:1;
    plot(repelem(0.05,length(y_line_1)),y_line_1,':','Color','k');
    plot(repelem(0.62,length(y_line_1)),y_line_1,':','Color','k');
    plot(repelem(0.80,length(y_line_1)),y_line_1,':','Color','k');
    plot(x_line,repelem(zMin,length(x_line)),':','Color','k');
    plot(repelem(0.30,length(y_line_2)),y_line_2,':','Color','k');
    plot(repelem(0.75,length(y_line_2)),y_line_2,':','Color','k');
    axis([-0.025 1 -2 4]);
    title({'Number of link communities connected' ...
            [ 'to each node in ' group ' at gamma = ' num2str(gamma)] });
    xlabel('Participation Coefficient');
    ylabel('Within-Module Degree z-score');
    legend(p);
    hold off;