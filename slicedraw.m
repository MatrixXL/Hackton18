function []=slicedraw(xslice, yslice, zslice)
global global_data_x;
global global_data_y;
global global_data_z;
global global_data_v;
%[x,y,z]=meshgrid(-2:.05:2,-2:.05:2,-2:.05:2);
% color function
%v = x.*exp(-x.^2-y.^2-z.^2);
h=slice(global_data_x,global_data_y,global_data_z,global_data_v,xslice,yslice,zslice);
axis([300 4500 -800 800 10 1100]);
%set(h,'edgecolor','none');
title('Signal Intensity');
xlabel('x');
ylabel('y');
zlabel('z');
colormap jet;
c=colorbar;
c.Label.String='Average  normalized RSSI'
end



