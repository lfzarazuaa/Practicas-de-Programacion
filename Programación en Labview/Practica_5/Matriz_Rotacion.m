clc, clear all, close all
Angulo=0:360;
% for i=1:length(Angulo);
% R=[cosd(Angulo(i)),sind(Angulo(i));sind(Angulo(i)),cosd(Angulo(i))]*[150;150];
% Resx(i)=R(1);
% Resy(i)=R(2);
% end
% plot3(Resx,Resy,Angulo)
for i=1:length(Angulo);
Mx=[1,0,0;...
    0,cosd(Angulo(i)),-sind(Angulo(i));...
    0,sind(Angulo(i)),cosd(Angulo(i))];
My=[cosd(Angulo(i)),0,sind(Angulo(i));...
    0,1,0;...
    -sind(Angulo(i)),0,cosd(Angulo(i))];
Mz=[cosd(Angulo(i)),-sind(Angulo(i)),0;...
    sind(Angulo(i)),cosd(Angulo(i)),0;...
    0,0,1];
V=[150,150,0]';
Rx=Mx*V;
Rxx(i)=Rx(1);
Rxy(i)=Rx(2);
Rxz(i)=Rx(3);
Ry=My*V;
Ryx(i)=Ry(1);
Ryy(i)=Ry(2);
Ryz(i)=Ry(3);
Rz=Mz*V;
Rzx(i)=Rz(1);
Rzy(i)=Rz(2);
Rzz(i)=Rz(3);
end
figure,plot3(Rxx,Rxy,Rxz)
figure,plot3(Ryx,Ryy,Ryz)
figure,plot3(Rzx,Rzy,Rzz)