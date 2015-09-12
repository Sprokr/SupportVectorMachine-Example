function [dataPoints] = getCircularPoints(totalPointsC1,totalPointsC2)
dataPoints = zeros(totalPointsC1+totalPointsC2,2);
r1 = rand(1,totalPointsC1);
a1 = randperm(360,totalPointsC1);
for ipLoop=1:totalPointsC1 
    xpoint = r1(ipLoop)*sin(a1(ipLoop));
    ypoint = r1(ipLoop)*cos(a1(ipLoop));
    dataPoints(ipLoop,:) = [xpoint,ypoint];
end
plot(dataPoints(1:totalPointsC1,1), dataPoints(1:totalPointsC1,2), 'r+', 'LineWidth', 2);
axis([-3 3 -3 3]);
hold on;

r2 = 1+rand(1,totalPointsC2);
a2 = randperm(360,totalPointsC2);
for ipLoop1=1:totalPointsC2
    xpoint = r2(ipLoop1)*sin(a2(ipLoop1));
    ypoint = r2(ipLoop1)*cos(a2(ipLoop1));
    dataPoints(ipLoop1+totalPointsC1,:) = [xpoint,ypoint];
end
plot(dataPoints(1+totalPointsC1:end,1), dataPoints(1+totalPointsC1:end,2), 'g+', 'LineWidth', 2);
pause(2);
close all;