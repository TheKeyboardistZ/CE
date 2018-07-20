function [testo] = converti(stringa)
% CONVERTI Questa funzione converte una stringa in un vettore di celle
testo = zeros(length(stringa),1);
for i = 1:length(stringa)
    testo(i) = stringa(i);
end
 testo = cellstr(num2str(testo));

end

