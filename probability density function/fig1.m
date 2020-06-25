load('arc/dongya_arcdist_nonproject.mat')
load('arc/nanmei_arcdist_nonproject.mat');
load('arc/sumendala_dist_nonproject.mat');
load('arc/vanuatu_dist_nonproject.mat');
arcData=[dongya_arc_total_Nb;nanmei_arc_total_Nb;sumendala_arc_total_Nb;vanuatu_arc_total_Nb];
load('intra/dongya_intradist_nonproject.mat');
load('intra/nanmei_intradist_nonproject.mat');
intraData=[dongya_intra_total_Nb;nanmei_intra_total_Nb];

% figure
% histogram(arcData(:,3),[0:0.5:180]);
% hold on
% histogram(intraData(:,3),[0:0.5:180]);


figure
% histogram(dongya_arc_total_Nb(:,3),[0:0.5:180],'Normalization','pdf')
% hold on
% histogram(nanmei_arc_total_Nb(:,3),[0:0.5:180],'Normalization','pdf')
% histogram(sumendala_arc_total_Nb(:,3),[0:0.5:180],'Normalization','pdf')
% histogram(vanuatu_arc_total_Nb(:,3),[0:0.5:180],'Normalization','pdf')
pd1 = fitdist(dongya_arc_total_Nb(:,3),'Kernel','Kernel','epanechnikov');
pd2 = fitdist(nanmei_arc_total_Nb(:,3),'Kernel','Kernel','epanechnikov');
pd3 = fitdist(sumendala_arc_total_Nb(:,3),'Kernel','Kernel','epanechnikov');
pd4 = fitdist(vanuatu_arc_total_Nb(:,3),'Kernel','Kernel','epanechnikov');
pdarc=fitdist(arcData(:,3),'Kernel','Kernel','epanechnikov');
x0=0:0.01:80;
mypdf1=pdf(pd1,x0);
plot(x0,mypdf1/max(mypdf1),'LineWidth',3);
hold on
mypdf2=pdf(pd2,x0);
plot(x0,mypdf2/max(mypdf2),'LineWidth',3);
mypdf3=pdf(pd3,x0);
plot(x0,mypdf3/max(mypdf3),'LineWidth',3);
mypdf4=pdf(pd4,x0);
plot(x0,mypdf4/max(mypdf4),'LineWidth',3);
mypdf5=pdf(pdarc,x0);
plot(x0,mypdf5/max(mypdf5),'LineWidth',3);

pd6 = fitdist(dongya_intra_total_Nb(:,3),'Kernel','Kernel','epanechnikov');
pd7 = fitdist(nanmei_intra_total_Nb(:,3),'Kernel','Kernel','epanechnikov');
pdintra=fitdist(intraData(:,3),'Kernel','Kernel','epanechnikov');
mypdf6=pdf(pd6,x0);
plot(x0,mypdf6/max(mypdf6),'--','LineWidth',3);
mypdf7=pdf(pd7,x0);
plot(x0,mypdf7/max(mypdf7),'--','LineWidth',3);
mypdf8=pdf(pdintra,x0);
plot(x0,mypdf8/max(mypdf8),'--','LineWidth',3);

arcP=prctile(arcData(:,3),[25 75]);
[pdarcmax,index]=max(mypdf5);
mystd=(arcP(2)-arcP(1))*0.7413;
x1=x0(index)+mystd*2;
pdarcStd=mypdf5(x0>x1);
pdarcStd=pdarcStd(1);

plot(x0(index),1,'o','MarkerEdgeColor','k','MarkerFaceColor','r');
plot(x1,pdarcStd/pdarcmax,'o','MarkerEdgeColor','k','MarkerFaceColor','b');
% plot([x0(index) x0(index)],[1 pdarcStd/pdarcmax],'r');
% plot([x0(index) x1],[pdarcStd/pdarcmax pdarcStd/pdarcmax],'b');
legend({'东亚岛弧','南美弧型','苏门答腊岛弧','瓦努阿图岛弧','弧型区','东亚陆内','南美陆内','陆内区','极值点','阈值点'})
xlabel('Nb(ppm)');
ylabel('归一化密度函数')


