function a = avlength(alphabet,P)
%Ritorna la lunghezza media di un alfabeto
n = length(alphabet);
a = 0;
for i = 1:n
    a = a + numel(num2str(alphabet(i)))*P(i);
end

