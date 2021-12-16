function fullfilenames = fullpath(filenames)

%%
%       SYNTAX: p = fullpath(filenames);
%
%  DESCRIPTION: Return the full absolute path of the input files or folders.
%
%        INPUT: - filenames (char or N-D cell array of char or 
%                                    N-D array of categorical)
%                   Filename(s) or folder name(s).
%
%       OUTPUT: - fullfilenames (char or N-D cell array of char or 
%                                        N-D array of categorical)
%                   Full absolute filename(s) or folder name(s). If input
%                   filename or folder name does not exist, then this will be ''
%                   or {''} or undefined (for categorical).


%% Convert filenames to cell arry.
filenames1 = convert_filenames(filenames);


%% Get absolute file name(s) or folder name(s).
fullfilenames = cell(size(filenames1));
for n = 1:numel(filenames1)
    [status, values] = fileattrib(filenames1{n});
    if status == 0
        fullfilenames{n} = '';
    else
        tmp             = values.Name;
        tmp(1)          = lower(tmp(1));    % Force drive letter to lower case.
        fullfilenames{n} = tmp;
    end 
end


%% Convert fullfilenames to have the same data type as input.
if ischar(filenames)
    fullfilenames = fullfilenames{1};
elseif iscell(filenames)
    % Do nothing.
elseif iscategorical(filenames)
    fullfilenames = categorical(fullfilenames);
else
    error('Unknown data type.');
end


end
