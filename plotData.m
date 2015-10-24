function [] = plotData()
    subplot(2,2,1)
    plot(stat1)
    title('Average Power over last orbit');
    xlabel('Time (Minutes)')
    ylabel('Average Power (Watts)')
    axis square;
    subplot(2,2,2)
    plot(stat2)
    title('Difference between measured and estimated energy');
    xlabel('Orbits');
    ylabel('Measured - Estimated Energy')
    subplot(2,2,3)
    plot(stat3)
    title('Difference between measured energy and average energy level');
    xlabel('Orbits')
    ylabel('Measured - Average Energy')
    subplot(2,2,4)
    plot(P_est)
    title('Predicted Power for Next Orbit');
    xlabel('Orbits')
    ylabel('Power Prediction')
    axis square;
    
    % Noon-Mid Inputs
    subplot(1,2,1)
    plot(KF_vars_noonMidnight.Psolar_x,KF_vars_noonMidnight.Psolar_y);
    title('Solar Power vs Time')
    xlabel('Time (Minutes)')
    ylabel('Power (Watts)')
    axis([0 9108 0 10])
    subplot(1,2,2)
    plot(KF_vars_noonMidnight.Vbat_x, KF_vars_noonMidnight.Vbat_y);
    title('Battery Voltage')
    xlabel('Time (Minutes)')
    ylabel('Voltage (Volts)')
    
    % Dawn-Dusk Inputs
    subplot(2,2,1)
    plot(1:length(P_solar),P_solar)
    title('Solar Power vs Time')
    xlabel('Time (Minutes)')
    ylabel('Power (Watts)')
    subplot(2,2,2)
    plot(1:length(Esolar),Esolar)
    title('Solar Energy In vs Time')
    xlabel('Time (Minutes)')
    ylabel('Energy (Joules)')
    subplot(2,2,3)
    plot(1:length(Vbat),Vbat)
    title('Battery voltage vs Time')
    xlabel('Time (Minutes)')
    ylabel('Battery Voltage (Volts)')
    subplot(2,2,4)
    Ibat = I2-I3;
    plot(1:length(Ibat), Ibat)
    title('Battery current vs Time')
    xlabel('Time (Minutes)')
    ylabel('Battery Current (Amps)')
end



plot(1:95,Linear,1:95,DC_plus10,1:95,DC_minus10,1:95,DC_plusC,1:95,DC_minusC)
ylabel('P_est (Watts)')
xlabel('Actual Power (Watts)')
title('Prediction VS Actual Power comparison')
legend('Baseline','+10% DC Error','-10% DC Error','+10% Corrected','-10% Corrected','Location','SouthEast')
axis square

plot(0:10,P_est(1:11))
axis ([0,10,0,10])
xlabel('Time (Orbits / 92 mins per)')
ylabel('Estimated Power')
title('Predicted power use over 10 orbits (920 mins)')

