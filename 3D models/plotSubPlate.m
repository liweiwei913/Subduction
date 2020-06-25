function plotSubPlate(filename)
data=importdata(filename);
lon=data(:,1);
lat=data(:,2);
depth=data(:,3);

index=~isnan(depth);
lon=lon(index);
lat=lat(index);
depth=depth(index);

lonmin=min(lon);
lonmax=max(lon);
latmin=min(lat);
latmax=max(lat);

% plot3(lon,lat,depth)

F=scatteredInterpolant(lon,lat,depth,'natural','none');

[xx,yy]=meshgrid(lonmin:0.1:lonmax,latmin:0.1:latmax);
dd=F(xx,yy);

for i=1:size(xx,1)
    for j=1:size(xx,2)
        xx0=xx(i,j);
        yy0=yy(i,j);
        index = lon>=xx0-0.1 & lon<=xx0+0.1 & lat >=yy0-0.1 & lat<=yy0+0.1;
        if sum(index)==0
            dd(i,j)=nan;
        end
           
            
    end
end
dd(dd>0)=nan;
dd(dd<-660)=-660;

surface(xx,yy,dd);
hold on
end