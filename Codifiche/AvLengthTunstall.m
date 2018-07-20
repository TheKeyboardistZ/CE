function a = AvLengthTunstall(dict,P)
% Calcola la lunghezza media di un codice di Tunstall
n = length(dict);
a = 0;
for i = 1:n
    a = a + length(dict{i,1})*P(i);
end

