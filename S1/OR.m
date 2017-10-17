close; clear; clc;
net = newp([0 1; 0 1], 1,'hardlim'); %perceptron
%bramka nand
WE=[0 0 1 ; %wartosc 1. wejscia
    0 1 0 ]; %wartosc 2. wejscia
WY=[0 1 1 ]; %wartosc wyniku OR

net.name='Bramka OR';
plotpv(WE,WY);%wykres z wynikami

%parametry treningu
net.trainParam.epochs = 3; %max iloœæ epok
net.trainParam.goal = 0.001; %b³¹d œredniokwadratowy
net.trainParam.mu = 0.001; %wspó³czynnik uczenia

net = train(net, WE, WY); %uczenie
plotpc(net.iw{1,1}, net.b{1})%rysuje granice decyzyjna
%iw - wartosci wag synaptycznych
%b - wartoœæ progu perceptronu

Y=sim(net, WE);%symulacja 
test = randi([0 1],2,20);
%wylosowanie macierzy 2x20 wypelnionej 0 i 1
efekt=sim(net, test);%testowanie perceptronu
test
efekt