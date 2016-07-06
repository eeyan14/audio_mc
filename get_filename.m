function [filename] = get_filename(keyword, name, idx, trim)
% returns a file name to open im mclearner.m
% keyword, name, idx are ints
% keywords: 1) watson
%           2) siri
%           3) okay
%           4) google
%
% names:    1) ch_
%           2) es_
%
% trim = 0 if raw file, 1 if trimmed file

    if isequal(trim,0)
        if isequal(1,name) % ch_
            if isequal(1,keyword)
                filename = ['ch_','watson',num2str(idx),'.wav'];
            elseif isequal(2,keyword)
                filename = ['ch_','siri',num2str(idx),'.wav'];
            elseif isequal(3,keyword)
                filename = ['ch_','okay',num2str(idx),'.wav'];
            elseif isequal(4,keyword)
                filename = ['ch_','google',num2str(idx),'.wav'];
            end
        elseif isequal(2,name) % es_
            if isequal(1,keyword)
                filename = ['es_','watson',num2str(idx),'.wav'];
            elseif isequal(2,keyword)
                filename = ['es_','siri',num2str(idx),'.wav'];
            elseif isequal(3,keyword)
                filename = ['es_','okay',num2str(idx),'.wav'];
            elseif isequal(4,keyword)
                filename = ['es_','google',num2str(idx),'.wav'];
            end
        end
    end

    if isequal(trim,1)
        if isequal(1,name) % ch_
            if isequal(1,keyword)
                filename = ['ch_','watson','_t',num2str(idx),'.wav'];
            elseif isequal(2,keyword)
                filename = ['ch_','siri','_t',num2str(idx),'.wav'];
            elseif isequal(3,keyword)
                filename = ['ch_','okay','_t',num2str(idx),'.wav'];
            elseif isequal(4,keyword)
                filename = ['ch_','google','_t',num2str(idx),'.wav'];
            end
        elseif isequal(2,name) % es_
            if isequal(1,keyword)
                filename = ['es_','watson','_t',num2str(idx),'.wav'];
            elseif isequal(2,keyword)
                filename = ['es_','siri','_t',num2str(idx),'.wav'];
            elseif isequal(3,keyword)
                filename = ['es_','okay','_t',num2str(idx),'.wav'];
            elseif isequal(4,keyword)
                filename = ['es_','google','_t',num2str(idx),'.wav'];
            end
        end
    end

end

