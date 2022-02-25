import psycopg2
import random
 
try:
    conexion = psycopg2.connect(
        host = "localhost",
        port = "5432",
        user = "victor",
        password = "victor",
        dbname = "postgres"
    )
    print("conexión exitosa")
except psycopg2.Error as e:
    print("Ocurrio un error en la conexion")
    print("Verifique los parametros")

while True:
 print("""
    Juego simulado del Gran 8
    
    1) Jugar
    2) Ver historial
    0) Apagar consola
   
    """)
 try:
            opcion = int(input("Elige una opción: ") ) 

            if opcion == 1:
                
                n1=random.randint(1,6)
                n2=random.randint(1,6)
                suma=n1+n2
                print("La suma es", suma) 

                if suma==8:
                    estado="Ganaste"
                    print("Ganaste")
                elif suma==7:
                    estado="Pierdes"
                    print("Pierdes")
                else:
                    estado="Sigue Jugando"
                    print("Sigue Jugando")     

                cursor = conexion.cursor()
                cursor.execute("INSERT INTO ejercicio_examen_1(numero_1,numero_2,suma,estado) VALUES(%s,%s,%s,%s);",(n1,n2,suma,estado))
                conexion.commit()
                cursor.close()    


            if opcion == 2:

                cursor = conexion.cursor()
                SQL = 'SELECT*FROM ejercicio_examen_1;'
                cursor.execute(SQL)
                valores = cursor.fetchall()
                print(valores)
                cursor.close()
                

            if opcion == 0:
                break

 except :
  print("Ingrese solo numeros") 