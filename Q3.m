
clc
clear all
close all

data = readtable('endorsements.csv');

data_parties = table2cell(data(:,1:3));

%assign political parties
for indx = 1:height(data)
    if strcmp(data_parties(indx,3),'Mondale') == 1 || ...
       strcmp(data_parties(indx,3),'Dukakis') == 1 || ...
       strcmp(data_parties(indx,3),'Clinton') == 1 || ...
       strcmp(data_parties(indx,3),'Obama') == 1 || ...
       strcmp(data_parties(indx,3),'Gore') == 1 || ...
       strcmp(data_parties(indx,3),'Kerry') == 1 || ...
       strcmp(data_parties(indx,3),'Carter') == 1
        data_parties(indx,4) = {'D'};
    end
end

for indx = 1:height(data)
    if strcmp(data_parties(indx,3),'Bush') == 1 || ...
       strcmp(data_parties(indx,3),'Dole') == 1 || ...
       strcmp(data_parties(indx,3),'McCain') == 1 || ...
       strcmp(data_parties(indx,3),'Romney') == 1 || ...
       strcmp(data_parties(indx,3),'Trump') == 1 || ...
       strcmp(data_parties(indx,3),'Reagan') == 1
        data_parties(indx,4) = {'R'};
    end
end

for indx = 1:height(data)
    if strcmp(data_parties(indx,3),'None') == 1 || ...
       strcmp(data_parties(indx,3),'Not Trump') == 1 || ...
       strcmp(data_parties(indx,3),'Unknown') == 1
        data_parties(indx,4) = {'N'};
    end
end

for indx = 1:height(data)
    if strcmp(data_parties(indx,3),'Anderson') || ...
       strcmp(data_parties(indx,3),'Johnson')
        data_parties(indx,4) = {'O'};
    end
end

% did endorsements match election results?
% Republican
for indx = 1:height(data)
    if (cell2mat(data_parties(indx,2)) == 1980 || ...
        cell2mat(data_parties(indx,2)) == 1984 || ...
        cell2mat(data_parties(indx,2)) == 1988 || ...
        cell2mat(data_parties(indx,2)) == 2000 || ...
        cell2mat(data_parties(indx,2)) == 2004 || ...
        cell2mat(data_parties(indx,2)) == 2016) && ...
        strcmp(data_parties(indx,4),'R') == 1
        data_parties(indx,5) = {'Y'};
        
    elseif (cell2mat(data_parties(indx,2)) == 1980 || ...
            cell2mat(data_parties(indx,2)) == 1984 || ...
            cell2mat(data_parties(indx,2)) == 1988 || ...
            cell2mat(data_parties(indx,2)) == 2000 || ...
            cell2mat(data_parties(indx,2)) == 2004 || ...
            cell2mat(data_parties(indx,2)) == 2016) && ...
            strcmp(data_parties(indx,4),'R') ~= 1
        data_parties(indx,5) = {'N'};
    end
end
% Democrat
for indx = 1:height(data)
    if (cell2mat(data_parties(indx,2)) == 1992 || ...
        cell2mat(data_parties(indx,2)) == 1996 || ...
        cell2mat(data_parties(indx,2)) == 2008 || ...
        cell2mat(data_parties(indx,2)) == 2012) && ...
        strcmp(data_parties(indx,4),'R') == 1
        data_parties(indx,5) = {'Y'};
        
    elseif (cell2mat(data_parties(indx,2)) == 1992 || ...
            cell2mat(data_parties(indx,2)) == 1996 || ...
            cell2mat(data_parties(indx,2)) == 2008 || ...
            cell2mat(data_parties(indx,2)) == 2012) && ...
            strcmp(data_parties(indx,4),'R') ~= 1
        data_parties(indx,5) = {'N'};
    end
end
% fix the no predictions made, or two endorsements
for indx = 1:height(data)
    if strcmp(data_parties(indx,4),'N') == 1 || ...
       isempty(data_parties{indx,4}) == 1
        data_parties(indx,5) = {''};
    end
end

% calculate percent endorsement matching outcomes
% 1980
indx1980 = find(cell2mat(data_parties(:,2))==1980);
Ycount1980 = 0;
for indx = 1:numel(indx1980)
    if strcmp(data_parties(indx1980(indx),5),'Y') == 1 
        Ycount1980 = Ycount1980 + 1;
    end
end
percentMatch1980 = Ycount1980/numel(indx1980);
% 1984
indx1984 = find(cell2mat(data_parties(:,2))==1984);
Ycount1984 = 0;
for indx = 1:numel(indx1984)
    if strcmp(data_parties(indx1984(indx),5),'Y') == 1 
        Ycount1984 = Ycount1984 + 1;
    end
end
percentMatch1984 = Ycount1984/numel(indx1984);
% 1988
indx1988 = find(cell2mat(data_parties(:,2))==1988);
Ycount1988 = 0;
for indx = 1:numel(indx1988)
    if strcmp(data_parties(indx1988(indx),5),'Y') == 1 
        Ycount1988 = Ycount1988 + 1;
    end
end
percentMatch1988 = Ycount1984/numel(indx1988);
% 1992
indx1992 = find(cell2mat(data_parties(:,2))==1992);
Ycount1992 = 0;
for indx = 1:numel(indx1992)
    if strcmp(data_parties(indx1992(indx),5),'Y') == 1 
        Ycount1992 = Ycount1992 + 1;
    end
end
percentMatch1992 = Ycount1992/numel(indx1992);
% 1996
indx1996 = find(cell2mat(data_parties(:,2))==1996);
Ycount1996 = 0;
for indx = 1:numel(indx1996)
    if strcmp(data_parties(indx1996(indx),5),'Y') == 1 
        Ycount1996 = Ycount1996 + 1;
    end
end
percentMatch1996 = Ycount1996/numel(indx1996);
% 2000
indx2000 = find(cell2mat(data_parties(:,2))==2000);
Ycount2000 = 0;
for indx = 1:numel(indx2000)
    if strcmp(data_parties(indx2000(indx),5),'Y') == 1 
        Ycount2000 = Ycount2000 + 1;
    end
end
percentMatch2000 = Ycount2000/numel(indx2000);
% 2004
indx2004 = find(cell2mat(data_parties(:,2))==2004);
Ycount2004 = 0;
for indx = 1:numel(indx2004)
    if strcmp(data_parties(indx2004(indx),5),'Y') == 1 
        Ycount2004 = Ycount2004 + 1;
    end
end
percentMatch2004 = Ycount2004/numel(indx2004);
% 2008
indx2008 = find(cell2mat(data_parties(:,2))==2008);
Ycount2008 = 0;
for indx = 1:numel(indx2008)
    if strcmp(data_parties(indx2008(indx),5),'Y') == 1 
        Ycount2008 = Ycount2008 + 1;
    end
end
percentMatch2008 = Ycount2008/numel(indx2008);
% 2012
indx2012 = find(cell2mat(data_parties(:,2))==2012);
Ycount2012 = 0;
for indx = 1:numel(indx2012)
    if strcmp(data_parties(indx2012(indx),5),'Y') == 1 
        Ycount2012 = Ycount2012 + 1;
    end
end
percentMatch2012 = Ycount2012/numel(indx2012);
% 2016
indx2016 = find(cell2mat(data_parties(:,2))==2016);
Ycount2016 = 0;
for indx = 1:numel(indx2016)
    if strcmp(data_parties(indx2016(indx),5),'Y') == 1 
        Ycount2016 = Ycount2016 + 1;
    end
end
percentMatch2016 = Ycount2016/numel(indx2016);

percentMatch = [percentMatch1980, percentMatch1984, ...
                percentMatch1988, percentMatch1992, ...
                percentMatch1996, percentMatch2000, ...
                percentMatch2004, percentMatch2008, ...
                percentMatch2012, percentMatch2016];
            
percentMatch_mean = mean(percentMatch);
percentMatch_std = std(percentMatch);

figure;plot(percentMatch*100)
xlabel('Election Year')
ylabel('Percent (%)')
xticklabels({'1980', '1984', '1988', '1992', '1996', '2000', ...
             '2004', '2008', '2012', '2016'})
xtickangle(45)
set(gcf, 'Position', [100, 100, 900, 500])
title('Percent newspaper endorsement matching election outcome')

%ie: Austin American-Statesman
AAS = 0;
count = 1;
for indx = 1:height(data)
    if strcmp(data_parties(indx,1),'Austin American-Statesman') == 1 && ...
       strcmp(data_parties(indx,5),'Y') == 1 
        count = count + 1;
        AAS(count) = AAS(count-1) + 1;
    elseif strcmp(data_parties(indx,1),'Austin American-Statesman') == 1 && ...
           strcmp(data_parties(indx,5),'Y') ~= 1 
       count = count + 1;
       AAS(count) = AAS(count-1);
    end
end

figure;plot(AAS, '-o')
xlabel('Election Year')
ylabel('Number of matching endorsements')
xticklabels({'1980', '1984', '1988', '1992', '1996', '2000', ...
             '2004', '2008', '2012', '2016'})
xtickangle(45)
set(gca,'ytick',0:5)
set(gca,'ylim',[0,5])
set(gcf, 'Position', [100, 100, 900, 500])
title('Number of endorsements matching election outcome for the Austin American-Statesman')


