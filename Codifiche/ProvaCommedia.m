function ProvaCommedia(n,step)
%PROVA COMMEDIA Questa funzione testa la codifica di Huffman e quella di
%Tunstall su un frammento della Divina Commedia. n è la lunghezza massima
%del frammento, step è il passo del test
    close all;
    
    %% Inizializzazione
    timeH = zeros(ceil(n/step),1);
    timeT = zeros(ceil(n/step),1);
    rapportoH = zeros(ceil(n/step),1);
    rapportoT = zeros(ceil(n/step),1);
    
    %% Test
    i = 1;
    for j = step:step:n
        [timeT(i),timeH(i),rapportoT(i),rapportoH(i)] = dC(j);
        i = i+1;
    end
    i = i-1;
    
    %% Grafici 
    
    plot(step:step:i*step,timeH);
    title('Tempo Huffman');
    figure
    plot(step:step:i*step,timeT);
    title('Tempo Tunstall');
    figure
    plot(step:step:i*step,rapportoH);
    title('Rapporto Huffman');
    figure
    plot(step:step:i*step,rapportoT);
    title('Rapporto Tunstall');
end