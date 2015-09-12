clc;
clear all;
totalPointsC1 = 150;
totalPointsC2 = 50;
dataInput = getCircularPoints(totalPointsC1,totalPointsC2);

totalPoints = totalPointsC1 + totalPointsC2;


labels = ones(totalPoints,1);
labels(1+totalPointsC1:totalPoints) = 0;


[train,test]=crossvalind('holdOut',labels,0.1);

cp=classperf(labels);
% rbf with sigma=0.1
% SVMstruct = svmtrain(dataInput(train,:),labels(train),'Kernel_Function','rbf','rbf_sigma',.7,'showplot',true);

% polynomial
% SVMstruct = svmtrain(dataInput(train,:),labels(train),'Kernel_Function','polynomial','polyorder',2,'showplot',true);
% linear
SVMstruct = svmtrain(dataInput(train,:),labels(train),'Kernel_Function','polynomial','polyorder',2,'showplot',true);

classes=svmclassify(SVMstruct,dataInput(test,:),'showplot',true);
classperf(cp,classes,test); 
cp.CorrectRate

% numTestPoints = 10;
% testPoints = zeros(numTestPoints,3);
% for nt=1:numTestPoints
%     class = 0;
%     [xpoint ypoint button] = ginput(1);
%     if button == 1
%         class = 1;
%     end
%     testPoints(nt,:) = [xpoint ypoint class];
% end
% classes1=svmclassify(SVMstruct,testPoints(:,2),'showplot',true);