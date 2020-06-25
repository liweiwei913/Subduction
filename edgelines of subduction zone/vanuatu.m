load  vanuatu.xyz;

long=vanuatu(:,1);  la=vanuatu(:,2);

index=~isnan(vanuatu(:,3));

new_long=long(index);  new_la=la(index);   T=[new_long,new_la];    %5万4数据

%下降区间
len=-11.14:-0.02:-22.58;  %纬度测试

start=-11.14;

for i=1:length(len)
    temp=[];
    
    temp=new_long(find(new_la==start));

   if isempty(temp)==1
       vanuaturesult(i,1)=9999;
       vanuaturesult(i,2)=start;
   else
       vanuaturesult(i,1)=min(temp);
       vanuaturesult(i,2)=start;
   end
     
    start=round(start-0.02,2);
end

plot(vanuaturesult(:,1),vanuaturesult(:,2),'g','Linewidth',3);

filename='vanuatu_edgeline.xls';
xlswrite(filename,vanuaturesult);