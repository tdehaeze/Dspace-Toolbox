function [] = getListDataExperiment(exp_name)
loaded_data = load(['./data/', exp_name, '.mat']);

exp_data = loaded_data.(exp_name);

exp_data.Y.Path
end
