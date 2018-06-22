function [time] = getTimeExperiment(exp_name)
loaded_data = load(['./data/', exp_name, '.mat']);

exp_data = loaded_data.(exp_name);

time = exp_data.X.Data;
end
