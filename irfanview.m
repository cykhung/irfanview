function irfanview(filenames)

exe = fullfile(fileparts(mfilename('fullpath')), 'private', 'iview457_x64', ...
    'i_view64.exe');

if (nargin == 1) && strcmp(filenames, 'close')
    cmd = sprintf('"%s" /killmesoftly', exe);
    dos(cmd);
else
    filenames = convert_filenames(filenames);
    for n = 1:numel(filenames)
        cmd = sprintf('"%s" "%s" &', exe, fullpath(filenames{n}));
        dos(cmd);
    end
end

end

