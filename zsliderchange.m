function []=zsliderchange(source, event)
data=source.Value;
source.UserData = data;
y=findobj('Tag','slidery');
yslice=y.UserData;
x=findobj('Tag','sliderx');
xslice=x.UserData;
slicedraw(xslice, yslice,source.Value);
end