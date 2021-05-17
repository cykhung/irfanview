function irfanview(filenames)

exe = fullfile(fileparts(mfilename('fullpath')), 'iview457_x64', ...
    'i_view64.exe');
exe = [exe, ' '];

if (nargin == 1) && strcmp(filenames, 'close')
    cmd = [exe, '/killmesoftly'];
    dos(cmd);
else
    filenames = convert_filenames(filenames);
    for n = 1:numel(filenames)
        cmd = exe;
        cmd = [cmd, sprintf('"%s" ', filenames{n})];
        cmd = [cmd, sprintf('&')];
        dos(cmd);
    end
end

end

