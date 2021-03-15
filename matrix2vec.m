function v = matrix2vec(A)
%--------------------------------------------------------------------------
% This function is used to extract Upper triangular values of a adjacency
% matrix.
%
% input:
%       A: a adjacency matrix
%
% Hao Wang, UESTC, Chengdu, 2019/04/01, hall.wong@outlook.com
%--------------------------------------------------------------------------

m  = (1:size(A,1))' < (1:size(A,2));
v  = A(m);

end