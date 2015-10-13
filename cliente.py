import  socket, os
#os.popen("mysqldump --user=root --password=tavoisba18 matriz > C:\\enviar\\respaldo.sql")
ruta = "/Users/josealejandrosorianogarcia/phyton/Enviar/"
filename = "respaldo2.sql"
HOST = "192.168.43.50"

CPORT = 9004
FPORT = 9005

control = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
control.connect((HOST,CPORT))
control.send("SEND" + filename)
control.close()

archivo = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
archivo.connect((HOST,FPORT))

f= open(ruta+filename,"rb")
datos=f.read()
f.close()

archivo.send(datos)
archivo.close()
