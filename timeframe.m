## -*- texinfo -*-
## @deftypefn {Function File} {} display_rounded_matrix ()
##   Displays a matrix with a engineering format, 
## with different precision for different columns.  
##
## @code{display_rounded_matrix (@var{matrix},@var{significative},@var{output})} 
##  displays the matrix @var{matrix} with @var{significative} cyphers in each column.
##  If not @var{output} is given, the stdout is used.
##  @var{significative} could be a column vector, with the same number of columns as the matrix.
## @end deftypefn

######################################################################################################
#
# Function to retrieve the time in µs from the frame number in the Cordin multiframe camera.
#	It is adjusted for the Malena-winter-2017 experiments.
######################################################################################################



function tiempo = timeframe(frame)
 tiempo = (frame-1)*2 + 0.050;#time in us.
 return;
endfunction
