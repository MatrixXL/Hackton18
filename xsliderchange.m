function []=xsliderchange(source, event)
data=source.Value;
source.UserData = data;
y=findobj('Tag','slidery');
yslice=y.UserData;
z=findobj('Tag','sliderz');
zslice=z.UserData;
slicedraw(source.Value,yslice, zslice);
end