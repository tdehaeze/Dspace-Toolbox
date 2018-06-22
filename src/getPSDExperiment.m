function [pxx, freqs] = getPSDExperiment(exp_name, variable_name, psd_f)
% Load Data
variable_data = getDataExperiment(exp_name, variable_name);

%
Fs = getSamplingFrequency(exp_name);
Ts = 1/Fs;

if nargin == 2 % Not specifying the frequency
    n_windows = floor(length(variable_data)/10);
    psd_f = [];
elseif length(psd_f) == 1 % Just specifying the lowest wanted frequency
    n_windows = floor(length(variable_data)/psd_f);
    psd_f = [];
else % Specifying the vector of frequencies
    if psd_f(1) > 0
        n_windows = floor(1/(Ts*psd_f(1)));
    else
        n_windows = floor(1/(Ts*psd_f(2)));
    end
end

% Create Windows for PSD computation
han_windows = hanning(n_windows);

% Compute PSD
[pxx, freqs] = pwelch(variable_data, han_windows, 0, psd_f, 1/Ts);

pxx = pxx(4:end);
freqs = freqs(4:end);

% If we provide a vector of frequency, it will compute two-sided PSD, so we have to multiply the
% result by 2 to have to correct value...
if ~isempty(psd_f)
    pxx = pxx*2;
end

end
