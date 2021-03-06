function [ r_cfo , r_sfo ] = estimate_residual_cfo_sfo(rx_sym, h)

load ../Mat_Files/Parameters.mat

%  ... add your code here ... %
X = rx_sym./h;
% x=zeros(1,size(h,2));
% y=zeros(1,size(h,2));
% for m=1:1:num_bins
%     x(m) = convert_bin_index_fft_to_normal(m,num_bins);
%     y(m) = angle(X(m));
% end
% y = unwrap(y);
% scatter(x,y);
phase = zeros(1,num_bins_pilots);
for m=1:1:num_bins_pilots
    norm = convert_bin_index_normal_to_fft(pilots(m),num_bins);
    if bits_pilots(m) == 1
        phase(m) = angle(X(norm)*-1);
    else
        phase(m) = angle(X(norm));
    end
end

phase = unwrap(phase);
% scatter(pilots,phase);
r_sfo = regress(pilots.',phase.');
r_cfo = phase(1)-r_sfo*pilots(1);
% slope = regress(fftpilot.',phase.');
% yint= mean(phase);
% r_cfo = fs/(2*pi*(num_bins+cp))*yint;
% r_sfo = slope*num_bins*fs/(2*pi*(num_bins+cp));
end