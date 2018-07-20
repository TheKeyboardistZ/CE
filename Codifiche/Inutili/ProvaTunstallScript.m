function ProvaTunstallScript(f)
close all; clear
l = 60;
r = zeros(l,1);
time = zeros(l,1);
for i = 3:l
    [r(i),time(i)] = simulaTunstall(1000,i,f);
end
plot(3:l,1,'x');
hold on
plot(3:l,r(3:l));
title('Rapporto di compressione in relazione al numero di caratteri');
hold off
figure
plot(3:l,time(3:l));
title('Tempo di esecuzione in relazione al numero di caratteri');