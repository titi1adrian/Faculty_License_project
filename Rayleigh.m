close all
clear all
clc

N = 10^6 % numarul de biti

%generare functie de transfer h = hre + j*him

hre = 1/sqrt(2)*randn(1,N);
him = j*1/sqrt(2)*randn(1,N);
h = hre + him ; % canalul Rayleigh

hist(abs(h),100);