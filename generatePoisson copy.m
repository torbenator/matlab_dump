function outputVect = generatePoisson(T,dt,freq,pacbias,spkbias)
    %T = length of time to simulate poisson spiking
    %dt = step of sampling rate
    %freq = frequency of spike train to generate
    %pacbias = Hz of oscillation to bias spiking towards
    if nargin <4
        pacbias=0
        spkbias=0;
    end
    
    if nargin < 5
        spkbias =0;
    end
    
    time_vect = (0:dt:T);
    if spkbias == 0
        pspike = freq*dt; %probability that a spike happens at each sample
    else
        pspike= freq*dt*spkbias; 
    end
    if pacbias == 0
        outputVect=pspike > rand(size(time_vect)); %poisson spiking
    else
        nudge = 0.70;
        pacbias_wave = 1/2+nudge+sin(2*pi*pacbias*time_vect)/2;
        %plot(pacbias_wave.*rand(size(time_vect)))
        outputVect=pspike > pacbias_wave.*rand(size(time_vect)); %biased poisson spiking
    end