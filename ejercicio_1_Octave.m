pkg load database

n1=2
n2=12
n=dados(n1,n2)
n = round ((n2-n1).*rand(1,1)+n1)
if n==8
    respuesta='ganaste'
elseif n==7
    respuesta='perdiste'
else
    respuesta='sigue jugando'   
    
end


conn= pq_connect(setdbopts('dbname', 'postgres', 'host', 'localhost', 'port', '5432', 'user', 'victor', 'password', 'victor'))
params=cell(1,4)
params{1,1}=n1;
params{1,2}=n2;
params{1,3}=n;
params{1,4}=respuesta;
N=pq_exec_params(conn, "insert into e_1_examen_octave(n1,n2,n,respuesta) values($1,$2,$3,$4);",params)






