# SOAT APP

_Aplicación de prueba para la compra de seguros para vehículos_

## Requerimientos 🚀

* Tener conocimientos básicos en el lenguaje Ruby on Rails y conexión a DB MySQL
* Saber como se manejan las pruebas con RSpec en Ruby on Rails
* Manejo de terminal en Mac o Linux
* Un correo para las pruebas de notificaciones
* Conocimientos en SMTP y sus configuraciones

### Pre-requisitos 📋

_Ruby 2.6.0_  
_Rails 5.2.3_  
_Base de datos MySQL_  

### Instalación 🔧

_Después de descargar el proyecto, puedes abrirlo en el editor de tu preferencia,_  
_luego abres el archivo .env y agregas tus credenciales, tanto de DB como del correo._

```
# Environment variables -------------------
DATABASE=''
DB_USER=''
DB_PASSWORD=''

# Use to RSpec gem ------------------------
RAILS_ENV='development'

# SMTP settings ---------------------------
SMTP_ADDRESS='smtp.gmail.com'
SMTP_DOMAIN='gmail.com'
SMTP_USER_NAME=''
SMTP_PASSWORD=''

```

_desde la terminal te ubicas en la carpeta raíz del proyecto he ingresas los comandos_

```
bundle install
```

```
rake db:create db:migrate db:seed
```

_en ese momento se creará un usuario admin con las siguientes credenciales_  

* user: root@admin.com
* password: 987654321

_Luego de ello debes correr el servidor de rails_

```
rails s
```

_puedes verificar esto en tu explorador por medio de la url http://localhost:3000_  
_donde te mostrará el login de la app y con las credenciales puedes ingresar_  

## Crear usuario como tomador 🔧

_En la sección del login puedes crear una cuenta de cliente dando click en:_

```
Sign up as customer
```

_Todos los datos del formulario son requeridos._


## Licencia 📄

MIT Licencia Copyright (c) Libardo Sánchez Vanegas 19-08-2019  
Por la presente se concede permiso, sin cargo alguno, a toda persona que obtenga
una copia de este software y de los archivos de documentación asociados SOAT,
para tratar con el Software sin restricciones, incluyendo
sin limitación los derechos de uso, copia, modificación, fusión, publicación,
distribuir, sublicenciar y/o vender copias del Software, y a
permitir que las personas a las que se les suministre el Software lo hagan.

## Expresiones de Gratitud 🎁 🍺 🎁

```
* He mejorado mis conocimientos en RSpec y el manejo de Testing 📢
* Gracias a Materialize CSS, es una librería excelente 🍺. 
* Al equipo de Ruby on Rails por ayudarnos en el control de librerías y versionamiento 🍺. 
* Thanks for watching and reading 🤓.
```

---