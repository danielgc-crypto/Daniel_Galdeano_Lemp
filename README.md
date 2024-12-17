# Daniel_Galdeano_Lemp
# Introducción

El objetivo de la práctica es desplegar un CMS en 3 capas con vagrant o docker. En mi casa yo he usado vagrant. Para conseguirlo he tenido que crear la infraestructura con un vagrant file que contenga:

- Base de Datos
- Servidor NFS
- Servidores Web (2)
- Balanceador de carga

![image](https://github.com/user-attachments/assets/29b64044-8df1-44aa-9b41-548dd7375893)


El objetivo del NFS es que almacena la información de Wordpress y los servidores web puedan acceder a él para estar siempre actualizados. El balanceador de carga lo que hará es repartir las peticiones entre los balanceadores según vayan viniendo.

# **Requisitos previos**

- Vagrant instalado en la máquina anfritión.
- VirtualBox para proveer las máquinas virtuales.
- Imagen Debian.
- Conexión de internet para poder instalar los paquetes necesarios.

# Configuración del vagrantfile

Como box ha sido necesario instalar “debian/bullseye64” para realizar la práctica.

Las redes están configuradas de tal manera de que las máquinas tengan conexión de manera contigua.

Balanceador><SvWeb><SGBD

## Ficheros de provisionamiento

Cada una de estas máquinas tiene un fichero de provisionamiento, la función de dicho fichero es hacer que al desplegar las máquinas desde el dispositivo anfitrión se despligue owncloud automáticamente.

### Script balanceador

![image](https://github.com/user-attachments/assets/86bf45df-711a-4883-99fa-e10b009460d7)


### Script WebServer

![image](https://github.com/user-attachments/assets/1d482556-78bf-4d91-999a-72b426ee2e2d)


### Script NFS

![image](https://github.com/user-attachments/assets/50967046-eff9-4c36-a956-0ca536016a86)


![image](https://github.com/user-attachments/assets/2b4847f0-e333-466c-afb5-d03d2bd578f7)


### Script balanceador

![image](https://github.com/user-attachments/assets/9a5437bf-a48a-43b4-8bdf-3ce1112be3e3)


Por si acaso tenía que hacer alguna instalación más desde cualquiera de los servidores no quité la default gateway de los servidores WEB, NFS y BBDD. Para quitarlo hay que poner:

```bash
sudo ip route del default
```

Una vez las máquinas de vagrant son levantadas solo es necesario poner la ip pública del balanceador y automáticamente saldrá la página de login de owncloud.

Para acceder lo único necesario es poner el login de administrador.

En mi caso es: 

admin

1234

![image](https://github.com/user-attachments/assets/7dfb1bec-cac3-40e6-a426-71873cdcfb66)

![image](https://github.com/user-attachments/assets/fe964977-d140-4fc5-8cac-6d66ae3f95d8)
