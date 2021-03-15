function [r] = compare_two_graphs(G1, G2)
%--------------------------------------------------------------------------
% This function is used to compute the similarity between two graphs with
% different network sizes/scales/types.
%
% input:
%       A: a adjacency matrix
%
% Hao Wang, UESTC, Chengdu, 2020/04/01, hall.wong@outlook.com
%--------------------------------------------------------------------------

% Count the frequency of the 2- to 4-node graphlets 
[~, Out_1] = WH_network_graphlet_ORCA(G1);
[~, Out_2] = WH_network_graphlet_ORCA(G2);

% The column index of 11 non-redundant orbits
index = [1:3 5:12];

% Extract the 11 non-redundant orbits. 
% To avoid the zero in the denominator, where we added 1 to each of the
% frequencies.
Node_orbit1 = Out_1(:,index)+1;
Node_orbit2 = Out_2(:,index)+1;

% Take the logarithm (10-base) of the normalized frequency
G_norm1  = log10(1+(Node_orbit1)./sum(Node_orbit1,2));
G_norm2  = log10(1+(Node_orbit2)./sum(Node_orbit2,2));

% transfer the MI matrix to vector
Value1 = matrix2vec(gretna_MI( G_norm1 ));
Value2 = matrix2vec(gretna_MI( G_norm2 ));

% calculate the Pearson correlation
r = corr(Value1, Value2);

end