function enco = tunstallenco(sig,dict)
% Questa funzione è stata ottenuta modificando huffmanenco

%TUNSTALLENCO Encode an input signal using Tunstall coding algorithm.
%    
%    ENCO = TUNSTALLENCO(SIG, DICT) encodes the input signal, SIG, based on 
%    the code dictionary, DICT. The code dictionary is generated using the
%    TUNSTALL function. Each of the symbols appearing in SIG must be
%    present in the code dictionary, DICT. The SIG input can be a numeric
%    vector or a single-dimensional cell array containing alphanumeric
%    values.
%    
%   

% % Error checking ------------------------
% 
% msg='';
% if nargin < 2
%     msg = getString(message('MATLAB:narginchk:notEnoughInputs'));
% elseif nargin > 2
%     msg = getString(message('MATLAB:narginchk:tooManyInputs'));
% else
%     msg = '';
% end
% if ( msg )
% 	error(message('comm:tunstallenco:InputArgumentCount'))
% end
% 
% % check if the input is a vector
% 
% if ( m ~= 1 && n ~= 1)
%     error(message('comm:tunstallenco:VectorInputSignal'));
% end
% 
% % End of error checking -----------------

[m,n] = size(sig);
if (~iscell(sig) )
	[m,n] = size(sig);
	sig = mat2cell(sig, ones(1,m), ones(1,n) );
end

% Find the size of the largest element in the dictionary, for preallocation
% purposes
maxSize = 0;
dictLength = size(dict,1);
for i = 1 : dictLength
    tempSize = size(dict{i,2},2);
    if (tempSize > maxSize)
        maxSize = tempSize;
    end
end

% Preallocate memory for enco
enco = zeros(1, length(sig)*maxSize);

idxCode = 1;
i=1;
while i <= length(sig)
    
    % For each signal value, search sequentially through the dictionary to
    % find the code for the given signal
    tempcode = [];
    %Cerca la prima coppia
    if i<length(sig)
    for j = 1 : dictLength
        
        
        if(length(strcat(sig{i},sig{i+1})) == length(dict{j,1})) 
            if( strcat(sig{i},sig{i+1}) == dict{j,1})
             tempcode = dict{j,2};
             break;
            end
        end
    end
     
   lenCode = length(tempcode);
    else
        lenCode = 0;
    end
   
   %Se non la trovo oppure sono arrivato all'ultima lettera cerco la prima lettera
   if (lenCode == 0)
       for j = 1 : dictLength
        if(length(sig{i}) == length(dict{j,1})) 
            if(sig{i} == dict{j,1})
             tempcode = dict{j,2};
             break;
            end
        end
        
       end
    
       lenCode = length(tempcode);
       if (lenCode == 0)
           if(i == length(sig))
               break;
           else
       error(message('comm:huffmanenco:CodeNotFound'))
           end
        else
            i = i+1;
        end
   else
       i = i+2;
   end
   
   
    enco(idxCode : idxCode+lenCode-1) = tempcode;
    idxCode = idxCode + lenCode;
end

% Strip off the unused vector elements
enco = enco(1:idxCode-1);

if( n == 1 )        % if input was a column vector
    enco = enco';   % convert the encoded signal to a column vector
end

% EOF -- tunstallenco
