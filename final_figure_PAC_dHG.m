%%
%correlate 
cd('/Users/Torben/Documents/surrogate_output/');
fnames = {'sw_mPSD_Pow_PAC_JH1.mat';'sw_mPSD_Pow_PAC_JH2.mat';'sw_mPSD_Pow_PAC_JH3.mat';'sw_mPSD_Pow_PAC_JH6.mat';'sw_mPSD_Pow_PAC_JH8.mat';'sw_mPSD_Pow_PAC_JH11.mat';'sw_mPSD_Pow_PAC_JH12.mat';'sw_mPSD_Pow_PAC_JH14.mat';'sw_mPSD_Pow_PAC_JH15.mat';'sw_mPSD_Pow_PAC_JH17.mat';'sw_mPSD_Pow_PAC_JH19.mat';'sw_mPSD_Pow_PAC_JH20.mat';'sw_mPSD_Pow_PAC_JH21.mat'};
fnames2 = {'sur_sw_mPSD_Pow_PAC_ec013.527.mat';'sur_sw_mPSD_Pow_PAC_ec013.528.mat';'sur_sw_mPSD_Pow_PAC_ec013.529.mat';'sur_sw_mPSD_Pow_PAC_ec013.713.mat';'sur_sw_mPSD_Pow_PAC_ec013.714.mat';'sur_sw_mPSD_Pow_PAC_ec013.754.mat';'sur_sw_mPSD_Pow_PAC_ec013.756.mat';'sur_sw_mPSD_Pow_PAC_ec013.757.mat';'sur_sw_mPSD_Pow_PAC_ec013.808.mat';'sur_sw_mPSD_Pow_PAC_ec013.844.mat'};
all_dat = zeros(1,128+113+87+95+105+128+128+123+57+108+95+112+81);
all_dat2 = zeros(1,31*10);
c=1;
for fi = 1:length(fnames)
fname = sprintf('sur_%s',char(fnames(fi)));
%fname = char(fnames(fi));
load(fname);
all_dat(1,c:c+size(surrogate_results,1)-1) = PACmPSDcorrs(1,1:size(surrogate_results,1));
c =c+size(surrogate_results,1);
end
figure;
hist(all_dat,100,'w')
title('Correlation between gamma power and PAC in ~1000 channels of rat CA1')
xlabel('r value')


%%
%surrogate fig
fnames = {'sw_mPSD_Pow_PAC_JH1.mat';'sw_mPSD_Pow_PAC_JH2.mat';'sw_mPSD_Pow_PAC_JH3.mat';'sw_mPSD_Pow_PAC_JH6.mat';'sw_mPSD_Pow_PAC_JH8.mat';'sw_mPSD_Pow_PAC_JH11.mat';'sw_mPSD_Pow_PAC_JH12.mat';'sw_mPSD_Pow_PAC_JH14.mat';'sw_mPSD_Pow_PAC_JH15.mat';'sw_mPSD_Pow_PAC_JH17.mat';'sw_mPSD_Pow_PAC_JH19.mat';'sw_mPSD_Pow_PAC_JH20.mat';'sw_mPSD_Pow_PAC_JH21.mat'};
all_dat = zeros(1,128+113+87+95+105+128+128+123+57+108+95+112+81);
c=1;
prove_it = zeros(1,31*10);
all_surr = zeros(31*10,1000);

for fi = 1:length(fnames2)
    %fname = sprintf('sur_%s',char(fnames(fi)));
    fname = char(fnames2(fi));
    load(fname);
    for chan = 1:size(surrogate_results2,1)
        all_dat2(1,c) = length(find(surrogate_results2(chan,:) < PACmPSDcorrs(1,chan)))/1000;
        c =c+1;
        prove_it(1,c) = PowPACcorrs(1,chan);
        all_surr(c,:) = surrogate_results2(chan,:);
    end
    
end

xbins = -.2:.01:.2;
[a,b] = hist(prove_it,xbins);
[c,d] = hist(all_surr(:),xbins);
[ax,b1,b2] = plotyy(d,c,b,a,'bar','bar','w');
set(b2,'FaceColor','blue');
set(b1,'FaceColor','white');
title('putative p values of correlation between PAC and mPSD in ~1000 channels of rat LFP data')
xlabel('r value')

%%
%correlate 
cd('/Users/Torben/Documents/surrogate_output/');
fnames = {'sw_mPSD_Pow_PAC_JH1.mat';'sw_mPSD_Pow_PAC_JH2.mat';'sw_mPSD_Pow_PAC_JH3.mat';'sw_mPSD_Pow_PAC_JH6.mat';'sw_mPSD_Pow_PAC_JH8.mat';'sw_mPSD_Pow_PAC_JH11.mat';'sw_mPSD_Pow_PAC_JH12.mat';'sw_mPSD_Pow_PAC_JH14.mat';'sw_mPSD_Pow_PAC_JH15.mat';'sw_mPSD_Pow_PAC_JH17.mat';'sw_mPSD_Pow_PAC_JH19.mat';'sw_mPSD_Pow_PAC_JH20.mat';'sw_mPSD_Pow_PAC_JH21.mat'};
fnames2 = {'sur_sw_mPSD_Pow_PAC_ec013.527.mat';'sur_sw_mPSD_Pow_PAC_ec013.528.mat';'sur_sw_mPSD_Pow_PAC_ec013.529.mat';'sur_sw_mPSD_Pow_PAC_ec013.713.mat';'sur_sw_mPSD_Pow_PAC_ec013.714.mat';'sur_sw_mPSD_Pow_PAC_ec013.754.mat';'sur_sw_mPSD_Pow_PAC_ec013.756.mat';'sur_sw_mPSD_Pow_PAC_ec013.757.mat';'sur_sw_mPSD_Pow_PAC_ec013.808.mat';'sur_sw_mPSD_Pow_PAC_ec013.844.mat'};
all_dat = zeros(1,128+113+87+95+105+128+128+123+57+108+95+112+81);
all_dat2 = zeros(1,31*10);
c=1;
for fi = 1:length(fnames2)
%fname = sprintf('sur2_%s',char(fnames(fi)));
fname = char(fnames2(fi));
load(fname);
all_dat2(1,c:c+size(surrogate_results2,1)-1) = PowPACcorrs(1,1:size(surrogate_results2,1));
c =c+size(surrogate_results2,1);
end

hist(all_dat2,25)
title('Correlation between gamma power and PAC in ~1000 channels of rat lfp')
xlabel('r value')

%%
%surrogate fig
fnames = {'sw_mPSD_Pow_PAC_JH1.mat';'sw_mPSD_Pow_PAC_JH2.mat';'sw_mPSD_Pow_PAC_JH3.mat';'sw_mPSD_Pow_PAC_JH6.mat';'sw_mPSD_Pow_PAC_JH8.mat';'sw_mPSD_Pow_PAC_JH11.mat';'sw_mPSD_Pow_PAC_JH12.mat';'sw_mPSD_Pow_PAC_JH14.mat';'sw_mPSD_Pow_PAC_JH15.mat';'sw_mPSD_Pow_PAC_JH17.mat';'sw_mPSD_Pow_PAC_JH19.mat';'sw_mPSD_Pow_PAC_JH20.mat';'sw_mPSD_Pow_PAC_JH21.mat'};
all_dat = zeros(1,128+113+87+95+105+128+128+123+57+108+95+112+81);
c=1;
hi_chans = [];
prove_it = zeros(1,31*10);
all_surr = zeros(31*10,1000);

for fi = 1:length(fnames2)
    %fname = sprintf('sur_%s',char(fnames(f)));
    fname = char(fnames2(fi));
    load(fname);
    for chan = 1:size(surrogate_results2,1)
        all_dat2(1,c) = length(find(surrogate_results2(chan,:) > PowPACcorrs(1,chan)))/1000;
        prove_it(1,c) = PowPACcorrs(1,chan);
        all_surr(c,:) = surrogate_results2(chan,:);
        c =c+1;
    end
end
xbins = -.1:.01:.1;
[a,b] = hist(prove_it,xbins);
[c,d] = hist(all_surr(:),xbins);
[ax,b1,b2] = plotyy(b,a,d,c,'bar','bar','w');
set(b1,'FaceColor','blue');
set(b2,'FaceColor','white');
title('Correlation between gamma power and mPSD in ~1000 channels of human ctx')
xlabel('r value')

%b1.FaceColor = 'w';
%%
%hist(all_dat2,50)
figure; hist(prove_it); figure; hist(all_surr(:))
title('putative p values of correlation between PAC and mPSD in ~1000 channels of rat LFP data')
xlabel('Bootstrapped p value')


%%
%gamma power vs slope 
cd('/Users/Torben/Documents/surrogate_output/');
fnames = {'sw_mPSD_Pow_PAC_JH1.mat';'sw_mPSD_Pow_PAC_JH2.mat';'sw_mPSD_Pow_PAC_JH3.mat';'sw_mPSD_Pow_PAC_JH6.mat';'sw_mPSD_Pow_PAC_JH8.mat';'sw_mPSD_Pow_PAC_JH11.mat';'sw_mPSD_Pow_PAC_JH12.mat';'sw_mPSD_Pow_PAC_JH14.mat';'sw_mPSD_Pow_PAC_JH15.mat';'sw_mPSD_Pow_PAC_JH17.mat';'sw_mPSD_Pow_PAC_JH19.mat';'sw_mPSD_Pow_PAC_JH20.mat';'sw_mPSD_Pow_PAC_JH21.mat'};
fnames2 = {'sur_sw_mPSD_Pow_PAC_ec013.527.mat';'sur_sw_mPSD_Pow_PAC_ec013.528.mat';'sur_sw_mPSD_Pow_PAC_ec013.529.mat';'sur_sw_mPSD_Pow_PAC_ec013.713.mat';'sur_sw_mPSD_Pow_PAC_ec013.714.mat';'sur_sw_mPSD_Pow_PAC_ec013.754.mat';'sur_sw_mPSD_Pow_PAC_ec013.756.mat';'sur_sw_mPSD_Pow_PAC_ec013.757.mat';'sur_sw_mPSD_Pow_PAC_ec013.808.mat';'sur_sw_mPSD_Pow_PAC_ec013.844.mat'};
all_dat = zeros(1,128+113+87+95+105+128+128+123+57+108+95+112+81);
all_dat2 = zeros(1,31*10);
c=1;
for fi = 1:length(fnames)
fname = sprintf('sur_%s',char(fnames(fi)));
%fname = char(fnames2(fi));
load(fname);
all_dat(1,c:c+size(surrogate_results,1)-1) = PowmPSDcorrs(1,1:size(surrogate_results,1));
c =c+size(surrogate_results,1);
end
figure;
hist(all_dat,100)
title('Correlation between gamma power and mPSD in ~1000 channels of human ctx')
xlabel('r value')


