pkg load database
p=input ('Ingrese un numero:');
n=0;
for i = 1:p
  r = rem(p,i);
  if r == 0
    n = n+1
  end
  end
  if n == 2
      fprintf('Es primo\n')
      estado='Primo'
  else
      fprintf('Es compuesto\n')
      estado='Compuesto'
  end
  
conn= pq_connect(setdbopts('dbname', 'postgres', 'host', 'localhost', 'port', '5432', 'user', 'victor', 'password', 'victor'))
params=cell(1,2)
params{1,1}=p;
params{1,2}=estado;
N=pq_exec_params(conn, "insert into e_4_examen_octave(numero,estado) values($1,$2);",params)
