function [ x_noise,y_noise ] = removeExtremos(x_noise,y_noise,ndsv)
media = mean(y_noise);
desvio = std(y_noise);
extInf = media - ndsv*desvio;
extSup = media + ndsv*desvio;
cont = 0;
for k = 1:length(y_noise)
    if y_noise(k) > extSup
        cont = cont+1;
        indice(cont) = k;
    end
    if y_noise(k) < extInf
        cont = cont+1;
        indice(cont) = k
    end
end
cont
y_noise(indice) = [];
x_noise(:,indice) = [];
end

