function [coh, freqs] = getCoherenceExperiment(exp_name, input_name, output_name, psd_f)
% Load Data
input_data = getDataExperiment(exp_name, input_name);
output_data = getDataExperiment(exp_name, output_name);

%
Fs = getSamplingFrequency(exp_name);
Ts = 1/Fs;

if nargin == 3 % Not specifying the frequency
    n_windows = floor(length(input_data)/10);
    psd_f = [];
elseif length(psd_f) == 1 % Just specifying the lowest wanted frequency
    n_windows = floor(length(input_data)/psd_f);
    psd_f = [];
else % Specifying the vector of frequencies
    if psd_f(1) > 0
        n_windows = floor(1/(dt*psd_f(1)));
    else
        n_windows = floor(1/(dt*psd_f(2)));
    end
end

% Create Windows for PSD computation
han_windows = hanning(n_windows);

% Compute PSD
[coh, freqs] = mscohere(input_data, output_data, han_windows, [], psd_f, 1/Ts);

coh = coh(4:end);
freqs = freqs(4:end);

end
