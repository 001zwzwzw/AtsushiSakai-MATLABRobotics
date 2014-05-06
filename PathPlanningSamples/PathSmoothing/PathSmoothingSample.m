function PathSmoothingSample()
clear all;
close all;

%�X���[�W���O�O�̃p�X
path=[0 0;
      1 0;
      2 0;
      3 0
      3 1
      3 2
      3 3
      3 4
      4 4
      5 4
      6 4];
  
optPath=PathSmoothing(path);
  
plot(path(:,1),path(:,2),'.b');hold on;
plot(optPath(:,1),optPath(:,2),'or');hold on;
axis([-1 7 -1 7])
grid on;

end

function optPath=PathSmoothing(path)
optPath=path;%���̃p�X���R�s�[

alpha=0;
beta=0.1;
torelance=0.00001;%�p�X�̕ω��ʂ�臒l(�ω��ʂ����̒l�ȉ��̎����������I��)
change=torelance;%�p�X�̈ʒu�̕ω���
while change>=torelance 
    change=0;%������
    for ip=2:(length(path(:,1))-1) %�n�_�ƏI�_�͌Œ�
        prePath=optPath(ip,:);%�ω��ʌv���p
        optPath(ip,:)=optPath(ip,:)+alpha*(path(ip,:)-optPath(ip,:));
        optPath(ip,:)=optPath(ip,:)+beta*(optPath(ip-1,:)+optPath(ip+1,:)-2*optPath(ip,:));
        change=change+norm(optPath(ip,:)-prePath);
    end
end

end