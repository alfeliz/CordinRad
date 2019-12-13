######################################################################################################
#
#  Octave program to pass the Cordin radius to mm.
#
# It uses the function:
#	 display_rounded_matrix			To write correctly the final output files.
#
######################################################################################################
#   This script will work ONLY in the folder with all the Cordin radial expansion 

more off; %To make the lines display when they appear in the script, not at the end of it.

clear; %Just in case there is some data in memory.

tic; %Total time of the script.

um = 60; #um/px (Cordin calibration for this MALENA experiment only)

mm = um*1e-3; #mm


main_folder = pwd; #Store the folder were this program is executed in a string variable.

shots = dir("*_rad.txt"); #Taking all the shots by the name of the plasma radial data.

for i=1:numel(shots)
  #Reading files and so on:
  shot = shots(i).name #Radial file with data to be transformed.
  str = shot(1:regexp(shot,'-')-1) #Shot for name of Synchro data file.
  fid_rad = fopen(shot,'r'); #ID of the radial data file.
  rad = textscan(fid_rad,'%f %f', 'HeaderLines', 1); #Read the radial data as a structure.
  radius = [rad{1}, rad{2} ]; #Transforming the structured data into a matrix.
  radius = sort(radius,1); #sort the matrix.
  radius(:,2) = radius(:,2) .* mm; #Adding the delay.
  #Closing fid files:
  %~ fclose(fid_time);
  fclose(fid_rad);
  #Saving data as a pro:
  file_sav = horzcat(str,'-rad-adj.txt');
  redond = [2 3];
  output = fopen(file_sav,"w"); #Opening the file.
  fdisp(output,"time(µs)	plasma_rad(mm)"); #First line.
  display_rounded_matrix(radius, redond, output); 
  fclose(output);
endfor;


toc;


#That's...that's all, folks! 
