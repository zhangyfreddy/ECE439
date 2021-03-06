function [ h_new ] = correct_residual_cfo_sfo(h_prev, r_cfo , r_sfo)
% 
%

load ../Mat_Files/Parameters.mat

%  ... add your code here ... %
h_new = h_prev;

for m=1:1:num_bins
    if sum(gaurd_bins == convert_bin_index_fft_to_normal(m,num_bins)) == 0 && sum(pilots == convert_bin_index_fft_to_normal(m,num_bins)) == 0
        norm = convert_bin_index_fft_to_normal(m,num_bins);
        phi = (fc+norm*w)*r_sfo - r_cfo;
        h_new(m) = h_prev(m)*exp(1j*phi);
    else
        h_new(m) = 0;
    end
end
end