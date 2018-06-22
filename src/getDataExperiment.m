function [variable_data] = getDataExperiment(exp_name, variable_name)
loaded_data = load(['./data/', exp_name, '.mat']);

exp_data = loaded_data.(exp_name);

variable_data = exp_data.Y(strcmp({exp_data.Y.Path},['Model Root/', variable_name])).Data;
end
