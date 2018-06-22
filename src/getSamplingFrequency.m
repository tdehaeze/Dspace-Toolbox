function [Fs] = getSamplingFrequency(exp_name)
time = getTimeExperiment(exp_name);
Fs = round((length(time)-1)/time(end));
end
