## -*- texinfo -*-
## @deftypefn {Function File} {} FrameRadius ()
##   Obtains a radius over time from a Cordin Frame.
##
## @code{rad = FrameRadius (@var{x})} returns the radius 
## from the frame file named x
## @end deftypefn


##########################################################
#
# Function to retrieve a trace from a Cordin Frame, in order 
#	to have a first estimation of the observed radius.
# It assumes that there is just one prominent peak, 
#	in principle the ~ cylindrical expansion of the wire.
#
##########################################################


function rad = FrameRadius(file)

matrix = imread(file); #Read the image as matrix

time = timeframe(str2num(file(regexp(file,'_')-3:regexp(file,'_')-1)));

suma = sum(matrix(800:1400,:),2); #Important part of the image profile. Changes with each experiment.

pk = find(suma>=max(suma)*0.75); #Bites of the peak

dist = (pk(end) - pk(1))*0.5; #Radius in bites

f = figure('visible','off');

plot(suma);

plotfile = horzcat(file,'-rad.jpg');

print(plotfile);

rad = [time, dist]; #time in µs, dist in px!!!!



endfunction;

#That's...that's all folks!!!
