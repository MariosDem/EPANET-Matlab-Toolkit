%% Sets pump curves.
% This example contains:
%   Load a network.
%   Computed Hydraulic & Quality Time Series via ENepanet binary file.
%   Plot pressures.
%   Get head curve.
%   Set new head curve values.
%   Computed hydraulics.
%   Unload library.

%%
%Clear 
clear; close('all'); clc;
start_toolkit;

% Load a network.
d = epanet('Net1.inp');

% Computed Hydraulic & Quality Time Series via ENepanet binary file.
Results = d.getComputedTimeSeries;

nodeID = '10';
indexNode = d.getNodeIndex(nodeID);

% Plot pressures.
figure;
subplot(2,1,1);
plot(Results.Time, Results.Pressure(:,indexNode));
title('Before set curve');
xlabel('Time (hrs)'); 
ylabel(['Pressure (', d.NodePressureUnits,')'])
    
% Get head curve.
headCurve = d.getLinkPumpHeadCurveIndex;

% Set new head curve values.
d.setCurve(headCurve,[2000 250]); 
%pumpIndex = d.getLinkPumpIndex
%d.getCurveIndex
%d.setLinkPumpHeadCurveIndex(pumpIndex, headCurve)

% Computed hydraulics.
Results = d.getComputedTimeSeries;  
subplot(2,1,2);
plot(Results.Time, Results.Pressure(:,indexNode));
title('After set curve');
xlabel('Time (hrs)'); 
ylabel(['Pressure (', d.NodePressureUnits,')'])

% Unload library.
d.unload

