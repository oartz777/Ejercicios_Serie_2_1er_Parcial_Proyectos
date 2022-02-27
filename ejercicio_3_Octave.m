pkg load database
precio = input('Ingrese el precio:');
IVA = precio * 0.12
Precio_SIN_IVA = precio-IVA

conn= pq_connect(setdbopts('dbname', 'postgres', 'host', 'localhost', 'port', '5432', 'user', 'victor', 'password', 'victor'))
params=cell(1,3)
params{1,1}=precio;
params{1,2}=IVA;
params{1,3}=Precio_SIN_IVA;
N=pq_exec_params(conn, "insert into e_3_examen_octave(precio, iva, precio_sin_iva) values($1,$2,$3);",params)


