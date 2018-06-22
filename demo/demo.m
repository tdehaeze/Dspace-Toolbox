% Define the name of the experiment
exp_name = 'noise_sensor_006';

% Show the list of data measured during the experiment
getListDataExperiment(exp_name)

% Get data and time vector
time = getTimeExperiment(exp_name);
displacement = getDataExperiment(exp_name, 'Displacement');

figure;
plot(time, displacement);
xlabel('Time [s]'); ylabel('Displacement [m]');
