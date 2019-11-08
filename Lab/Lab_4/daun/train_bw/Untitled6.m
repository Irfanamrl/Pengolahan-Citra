clc;
clear all;
files = dir('test_bw/*.jpg');
test_shape_feature = zeros(20,7);
for k = 1:numel(files)
    BW = imread(files(k).name);
    sf = regionprops(BW, 'EquivDiameter','Perimeter','Area','FilledArea','ConvexArea','Eccentricity','Orientation');
    shape_feature = [max(extractfield(sf,'EquivDiameter')) ... 
    max(extractfield(sf,'Perimeter')) ...
    max(extractfield(sf,'Area')) ...
    max(extractfield(sf,'FilledArea')) ...
    max(extractfield(sf,'ConvexArea')) ...
    max(extractfield(sf,'Eccentricity')) ...
    max(extractfield(sf,'Orientation'))];
    test_shape_feature(k,:) = shape_feature;
end
save('test_shape_feature.mat','test_shape_feature');

clc;
clear all;
files = dir('train_bw/*.jpg');
train_shape_feature = zeros(100,7);
for k = 1:numel(files)
    BW = imread(files(k).name);
    sf = regionprops(BW, 'EquivDiameter','Perimeter','Area','FilledArea','ConvexArea','Eccentricity','Orientation');
    shape_feature = [max(extractfield(sf,'EquivDiameter')) ... 
    max(extractfield(sf,'Perimeter')) ...
    max(extractfield(sf,'Area')) ...
    max(extractfield(sf,'FilledArea'))...
    max(extractfield(sf,'ConvexArea')) ...
    max(extractfield(sf,'Eccentricity')) ...
    max(extractfield(sf,'Orientation'))];
    train_shape_feature(k,:) = shape_feature;
end
save('train_shape_feature.mat','train_shape_feature');

train_label = ones(100,1);
train_label(51:end,1) = 2; 
test_label = ones(20,1);
test_label(11:end,1)=2;
save('label.mat','train_label','test_label');

train_label = zeros(100,1);
train_label(1:50,1) = 'daun_A'; 
test_label = ones(40,1);
test_label(11:end,1)=2;
save('label.mat','train_label','test_label');


svm = fitcsvm(train_shape_feature,train_label);
[svm_label,score] = predict(svm,test_shape_feature);

knn_3 = fitcknn(train_shape_feature,train_label,'NumNeighbors',3,'Standardize',1);
knn3_label = predict(knn_3,test_shape_feature);
[cm_knn3] = confusionmat(knn3_label,test_label)


knn_5 = fitcknn(train_shape_feature,train_label,'NumNeighbors',5,'Standardize',1);
knn5_label = predict(knn_5,test_shape_feature);
[cm_knn5] = confusionmat(knn5_label,test_label)

