clc,clear all, close all
[y,Fs]=audioread('Power.mp3');
audiowrite('Power.wav',y,Fs);