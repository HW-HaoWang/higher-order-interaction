function MIs = gretna_MI(Data)

%==========================================================================
% This function is used to calculate pairwise mutual information (MI) among
% all pairs of time series in the Data.
%
% Syntax: function  MIs = gretna_MI(Data)
%
% Input:
%       Data:
%            M*N data array (M, the number of samples; N, the number of
%            variables/regions).
%
% Output:
%        MIs:
%            Pairwise mutual information (N*N).
%
% Reference:
% Qiu, P., Gentles, A. J., & Plevritis, S. K. (2009). Fast calculation of
%   pairwise mutual information for gene regulatory network reconstruction.
%   Computer methods and programs in biomedicine, 94(2), 177-180.
%
% Example:
%          MIs = gretna_MI(rand(120,10))
%
% Hao WANG, CCBD, HZNU, Hangzhou, 2016/2/29, hall.wong@outlook.com
% 
% Change log:
% 2016/10/18: Normalizing mutual information using
% (MIs-min(MIs(:)))./(max(MIs(:))-min(MIs(:))), Modified by Hao WANG.
%==========================================================================
Data = Data';
[N, M] = size(Data);
MIs = zeros(N);    

% Silverman's (1986) rule of thumb (Bandwidth selection rules)
h = 1.06*std(Data,0,2)/(M^(1/5));     
h_square = mean(h.^2);

for i = 1:M
    tmp = Data - repmat(Data(:,i),1,M);
    tmp = exp(-(tmp.^2)/(2*h_square));
    tmp1 = sum(tmp,2);

    tmp2 = tmp*tmp';
    
    for j = 1:size(tmp2,1)
        tmp2(j,:) = tmp2(j,:)./tmp1(j);
        tmp2(:,j) = tmp2(:,j)./tmp1(j);
    end
    
    MIs = MIs + log(tmp2);
    clear tmp2
end

MIs = MIs/M + log(M);

% Normalization
MIs = (MIs-min(MIs(:)))./(max(MIs(:))-min(MIs(:)));
MIs(1:N+1:end) = 0;

return