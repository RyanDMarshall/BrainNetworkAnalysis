This document is to assist in navigating scripts created by Ryan Marshall and Dr. Alexandru Iordan for use in the lab of Dr. Patti Reuter-Lorenz.

Important files:
Analysis_YA_grp (found in /Scripts/) is the driver for group-level analyses. Analysis_YA_sub (found in /Scripts/) is the corresponding subject-level driver. These files perform the final analyses, including between-methods and over-time measure comparisons and hub identification.

analyze_group_rm and analyze_subject_rm (found in /Scripts/rm_func/) perform most of the analysis, including construction of the line graph, identification of node and link community partitions, and calculation of our three relevant measures (participation coefficient, within-module degree z-score, and link number [P, D, N respectively]). 

check_partition_consistency_grp and check_partition_consistency_sub (found in /Scripts/) examine the consistency of our community partitioning, by iterating the driver code five time and examining similarity between the resulting community partitions.

make_pres (found in /Scripts/) is the driver for visualization, including a few calls to plot_* functions and write_* functions (found in /Scripts/rm_func). plot_* functions use Matlab’s plotting functionality directly, while write_* functions creates .node, .edge, and .edgecolor functions for use in BrainNet Viewer. 

All other files are helper files. If the script desired begins with “ai_”, it is likely to be found in /Scripts/ai_func. If it ends in rm (Sorry for the inconsistency), it will be found in /Scripts/rm_func. Any other functions more likely than not can be found in the BCT (Brain Connectivity Toolbox).

