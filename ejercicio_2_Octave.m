pkg load database
n1 = input('Ingrese la primera nota:');
n2 = input('Ingrese la segunda nota:');
n3 = input('Ingrese la tercera nota:');
n4 = input('Ingrese la cuarta nota:');
n5 = input('Ingrese la quinta nota:');

notas= [n1,n2,n3,n4,n5]
media= mean(notas)
mediana= median(notas)
desviacion_estandar= std(notas)
varianza= var(notas)
moda= mode(notas)
rango= max(notas)-min(notas)

conn= pq_connect(setdbopts('dbname', 'postgres', 'host', 'localhost', 'port', '5432', 'user', 'victor', 'password', 'victor'))
params=cell(1,11)
params{1,1}=n1;
params{1,2}=n2;
params{1,3}=n3;
params{1,4}=n4;
params{1,5}=n5;
params{1,6}=media;
params{1,7}=mediana;
params{1,8}=desviacion_estandar;
params{1,9}=varianza;
params{1,10}=moda;
params{1,11}=rango;
N=pq_exec_params(conn, "insert into e_2_examen_octave(n1,n2,n3,n4,n5,media,mediana,desviacion_estandar,varianza,moda,rango) values($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11);",params)
