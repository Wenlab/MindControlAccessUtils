function ret =seekToFirstFrame(fid,fSTART)
% This function seeks to the the first frame of a YAML data file produced
% by the MindControl software.
%
% Returns 1 if success. 0 if failure.
%
% Andrew Leifer
% leifer@fas.harvard.edu
% 2 November 2010

disp('Seeking to first frame of YAML file.');
%Find Where the Frames Begin
k=1;
while 1 %unless otherwise
     k=k+1;
     
     %Read in a Line
     tline = fgets(fid); 
     
     %If we are at the end of the file, return an error.
     if ~ischar(tline)
         ret=0;
         disp('A frame was not found');
         disp(k);
         break
     end
     
     %If we Found the line with the frames marker
     expression = strcat('^[ \t\r\n\v\f]*FrameNumber:\s',num2str(fSTART),'[ \t\r\n\v\f]*$');
     if regexp(tline,expression)
         disp('Found beginning of frames');
         %tline = fgets(fid);
         break;
         if regexp(tline,'^[ \t\r\n\v\f]*-[ \t\r\n\v\f]*$')
             ret=1;
             break;
         else
             ret=0;
             disp('Could not actually find any frames.')
             break;
         end
        
     end
end
