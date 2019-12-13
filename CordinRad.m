###############################################################################################
#
#		Program to find the radius form Cordin images in JPG version.
#
###############################################################################################

clear;

more off; #Show whatever happens as it happens

tic; #Time measurement

main_folder = pwd; #Store the folder were this program is executed in a string variable.

addpath(main_folder);#to add the path to some functions stored in the main folder.

shots = dir("*-Cordin*"); #Cordin Shots directories

for i=3:numel(shots)
	if (shots(i).isdir==1)
		cd (horzcat(main_folder,'/ALEX-Cordin/',shots(i).name,'/AverageJPG')); #Going to the folder with the jpg images in each shot
		disp(shots(i).name);
		frames = dir();
		radius = [];
		for j=3:numel(frames)
			radius = [radius; FrameRadius(frames(j).name)];
		endfor;
		#SAVING DATA as a pro:
		[file_radius, msg] = fopen( horzcat(main_folder,'/ALEX-Cordin/',shots(i).name, '_plasma_rad.txt'), 'w');
		if (file_radius == -1) 
			error ("CordinRad program: Unable to open file name: %s, %s",filename, msg); 
		endif; 	
		
		fdisp(file_radius,"time(us) plasma_rad(px)");#first line (Columns Descriptor)
		redond = [3 3]; #Saved precision
		display_rounded_matrix(radius,redond,file_radius); #Saving data into a file nicely formatted
		fclose(file_radius); #Closing the file	
	endif;
	
	cd(main_folder);
  
endfor;


rmpath(main_folder); #To remove form the Octave path the one used in this program.

toc;
