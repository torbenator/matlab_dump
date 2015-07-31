%%
%total_size = 1360;

fnames = {'sw_mPSD_Pow_PAC_ec013.527.mat';'sw_mPSD_Pow_PAC_ec013.528.mat';'sw_mPSD_Pow_PAC_ec013.529.mat';'sw_mPSD_Pow_PAC_ec013.713.mat';'sw_mPSD_Pow_PAC_ec013.714.mat';'sw_mPSD_Pow_PAC_ec013.754.mat'};


for fi = 2:length(fnames);  
    disp(fi);
    surrogate_runs = 1000;
    fnames = {'sw_mPSD_Pow_PAC_ec013.527.mat';'sw_mPSD_Pow_PAC_ec013.528.mat';'sw_mPSD_Pow_PAC_ec013.529.mat';'sw_mPSD_Pow_PAC_ec013.713.mat';'sw_mPSD_Pow_PAC_ec013.714.mat';'sw_mPSD_Pow_PAC_ec013.754.mat'};
    fname = char(fnames(fi));
    cd('/Users/Torben/Documents/MATLAB/')
    load(fname)
    fnames = {'sw_mPSD_Pow_PAC_ec013.527.mat';'sw_mPSD_Pow_PAC_ec013.528.mat';'sw_mPSD_Pow_PAC_ec013.529.mat';'sw_mPSD_Pow_PAC_ec013.713.mat';'sw_mPSD_Pow_PAC_ec013.714.mat';'sw_mPSD_Pow_PAC_ec013.754.mat'};
    surrogate_results1 = zeros(size(mPSD,1),surrogate_runs);
    surrogate_results2 = zeros(size(mPSD,1),surrogate_runs);
    fname = char(fnames(fi));
    PACmPSDcorrs = zeros(1,size(mPSD,1));
    PowmPSDcorrs = zeros(1,size(mPSD,1));
    PowPACcorrs = zeros(1,size(mPSD,1));

    for x = 1:size(mPSD,1)
        disp(x);
        PACmPSDcorrs(1,x) = corr(mPSD(x,:)',PAC(x,:)');
        PowmPSDcorrs(1,x) = corr(mPSD(x,:)',Pow(x,:)');
        PowPACcorrs(1,x) = corr(Pow(x,:)',PAC(x,:)');

        for s = 1:surrogate_runs

            circdat = circshift(PAC(x,:)',randi(length(PAC)));
            surrogate_results1(x,s) = corr(mPSD(x,:)',circdat);
            surrogate_results2(x,s) = corr(Pow(x,:)',circdat);

        end
    end
    
    cd('/Users/Torben/Documents/surrogate_output/');
    outp = sprintf('sur_%s', fname);
    clearvars -except surrogate_results1 surrogate_results2 PACmPSDcorrs PowmPSDcorrs PowPACcorrs outp
    save(outp);
end


%%
%total_size = 1360;

%fnames = {'sw_mPSD_Pow_PAC_ec013.527.mat';'sw_mPSD_Pow_PAC_ec013.528.mat';'sw_mPSD_Pow_PAC_ec013.529.mat';'sw_mPSD_Pow_PAC_ec013.713.mat';'sw_mPSD_Pow_PAC_ec013.714.mat';'sw_mPSD_Pow_PAC_ec013.754.mat'};
fnames = {'sw_mPSD_Pow_PAC_JH1.mat';'sw_mPSD_Pow_PAC_JH2.mat';'sw_mPSD_Pow_PAC_JH3.mat';'sw_mPSD_Pow_PAC_JH6.mat';'sw_mPSD_Pow_PAC_JH8.mat';'sw_mPSD_Pow_PAC_JH11.mat';'sw_mPSD_Pow_PAC_JH12.mat';'sw_mPSD_Pow_PAC_JH14.mat';'sw_mPSD_Pow_PAC_JH15.mat';'sw_mPSD_Pow_PAC_JH17.mat';'sw_mPSD_Pow_PAC_JH19.mat';'sw_mPSD_Pow_PAC_JH20.mat';'sw_mPSD_Pow_PAC_JH21.mat'};

for fi = 2:length(fnames);  
    disp(fi);
    surrogate_runs = 1000;
    %fnames = {'sw_mPSD_Pow_PAC_ec013.527.mat';'sw_mPSD_Pow_PAC_ec013.528.mat';'sw_mPSD_Pow_PAC_ec013.529.mat';'sw_mPSD_Pow_PAC_ec013.713.mat';'sw_mPSD_Pow_PAC_ec013.714.mat';'sw_mPSD_Pow_PAC_ec013.754.mat'};
    fnames = {'sw_mPSD_Pow_PAC_JH1.mat';'sw_mPSD_Pow_PAC_JH2.mat';'sw_mPSD_Pow_PAC_JH3.mat';'sw_mPSD_Pow_PAC_JH6.mat';'sw_mPSD_Pow_PAC_JH8.mat';'sw_mPSD_Pow_PAC_JH11.mat';'sw_mPSD_Pow_PAC_JH12.mat';'sw_mPSD_Pow_PAC_JH14.mat';'sw_mPSD_Pow_PAC_JH15.mat';'sw_mPSD_Pow_PAC_JH17.mat';'sw_mPSD_Pow_PAC_JH19.mat';'sw_mPSD_Pow_PAC_JH20.mat';'sw_mPSD_Pow_PAC_JH21.mat'};
    fname = char(fnames(fi));
    cd('/Users/Torben/Documents/human_SW_analysis/')
    load(fname)
    fnames = {'sw_mPSD_Pow_PAC_JH1.mat';'sw_mPSD_Pow_PAC_JH2.mat';'sw_mPSD_Pow_PAC_JH3.mat';'sw_mPSD_Pow_PAC_JH6.mat';'sw_mPSD_Pow_PAC_JH8.mat';'sw_mPSD_Pow_PAC_JH11.mat';'sw_mPSD_Pow_PAC_JH12.mat';'sw_mPSD_Pow_PAC_JH14.mat';'sw_mPSD_Pow_PAC_JH15.mat';'sw_mPSD_Pow_PAC_JH17.mat';'sw_mPSD_Pow_PAC_JH19.mat';'sw_mPSD_Pow_PAC_JH20.mat';'sw_mPSD_Pow_PAC_JH21.mat'};
    %fnames = {'sw_mPSD_Pow_PAC_ec013.527.mat';'sw_mPSD_Pow_PAC_ec013.528.mat';'sw_mPSD_Pow_PAC_ec013.529.mat';'sw_mPSD_Pow_PAC_ec013.713.mat';'sw_mPSD_Pow_PAC_ec013.714.mat';'sw_mPSD_Pow_PAC_ec013.754.mat'};
    surrogate_results1 = zeros(size(mPSD,1),surrogate_runs);
    surrogate_results2 = zeros(size(mPSD,1),surrogate_runs);
    fname = char(fnames(fi));
    PACmPSDcorrs = zeros(1,size(mPSD,1));
    PowmPSDcorrs = zeros(1,size(mPSD,1));
    PowPACcorrs = zeros(1,size(mPSD,1));

    for x = 1:size(mPSD,1)
        disp(x);
        PACmPSDcorrs(1,x) = corr(mPSD(x,:)',PAC(x,:)');
        PowmPSDcorrs(1,x) = corr(mPSD(x,:)',Pow(x,:)');
        PowPACcorrs(1,x) = corr(Pow(x,:)',PAC(x,:)');

        for s = 1:surrogate_runs

            circdat = circshift(PAC(x,:)',randi(length(PAC)));
            surrogate_results1(x,s) = corr(mPSD(x,:)',circdat);
            surrogate_results2(x,s) = corr(Pow(x,:)',circdat);

        end
    end
    
    cd('/Users/Torben/Documents/surrogate_output/');
    outp = sprintf('sur3_%s', fname);
    clearvars -except surrogate_results1 surrogate_results2 PACmPSDcorrs PowmPSDcorrs PowPACcorrs outp
    save(outp);
end

