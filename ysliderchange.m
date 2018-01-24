function []=ysliderchange(source, event)
data=source.Value;
source.UserData = data;
x=findobj('Tag','sliderx');
xslice=x.UserData;
z=findobj('Tag','sliderz');
zslice=z.UserData;
slicedraw(xslice,source.Value,zslice);
end