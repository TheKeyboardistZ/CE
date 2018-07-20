function c = str2char (S)

c = char(S(1));
for i = 2:length(S)
    c = strcat(c,char(S(i)));
end

end

