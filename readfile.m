fid = fopen('output.txt','r');
bb = textscan(fid,'%s');
fclose(fid);
T=zeros(1163,7);
%disp(bb{1,1}{10,1});
%[x,y]=find(strcmp(bb{1,1}, 'FPS:0.0'));  
%disp(x(:,2));
aa=strfind(bb{1,1},'left=');
cc=strfind(bb{1,1},'FPS:0.0');
dd=strfind(bb{1,1},'Objects:');
%disp(aa{17,1});
j1=0;
for i=1:9670
    if aa{i,1}==1
        j1=j1+1;
    end
end
%disp(j1);
j2=0;
for k=1:9670
    if (dd{k,1}==1)&(cc{k+1,1}==1)
        j2=j2+1;
    end
end
%disp(j2);
num=0;
boxnum=0; 
box=0;
%num1=0;
for kk=1:9670
    if(cc{kk,1}==1)   
        boxnum=boxnum+box;
        if(box==0)
            boxnum=boxnum+1;
        end
            box=0;
            num=num+1;
            T(boxnum,1)=num-1;   
            T(boxnum,2)=box; 
    end 
        if(aa{kk,1}==1)     
            T(boxnum+box,1)=num-1;
            T(boxnum+box,2)=box+1;  
            pat='\w*(?=,)';
            T(boxnum+box,3)=str2num(cell2mat(regexp(bb{1,1}{kk+4,1},pat,'match')));
            %str2num(cell2mat(regexp(bb{1,1}{kk+4,1},pat,'match')))
            %T(boxnum+box,4)=str2double(strrep(bb{1,1}{kk-1,1},'%',''))/100;
            %class(bb{1,1}{kk-1,1});
            %disp(str2double(strrep(bb{1,1}{kk-1,1},'%',''))/100);
            T(boxnum+box,4)=str2num(cell2mat(regexp(bb{1,1}{kk,1},pat,'match')));
            T(boxnum+box,5)=str2num(cell2mat(regexp(bb{1,1}{kk+1,1},pat,'match')));
            T(boxnum+box,6)=str2num(cell2mat(regexp(bb{1,1}{kk+2,1},pat,'match')));
            T(boxnum+box,7)=str2num(cell2mat(regexp(bb{1,1}{kk+3,1},pat,'match')));
            box=box+1;
        end
        %disp(num);
end
%save C:\Users\zss\Desktop\data.txt -ascii T;
%csvwrite('C:\Users\zss\Desktop\data.txt',T);
fid1=fopen('C:\Users\zss\Desktop\data.txt','w');   
for ii=1:size(T,1) 
    fprintf(fid1,'%g,%g,%g,%g,%g,%g,%g,%g\r\n',T(ii,1),T(ii,2),T(ii,3),T(ii,4),T(ii,5),T(ii,6),T(ii,7));  
end

fclose(fid1);
    
%cell2mat(bb{1,1});
%[x(:,1),y]=find(strcmp(bb{1,1}, 'FPS:0.0'));  
%[x(:,2),y]=find(strcmp(bb{1,1}, 'Objects:'));
%[x(:,3),y]=find(strcmp(bb{1,1}, 'tvmonitor:'));

